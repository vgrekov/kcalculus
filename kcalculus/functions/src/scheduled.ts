import {
  searchClient,
} from '@algolia/client-search';
import CronExpressionParser from 'cron-parser';
import { firestore } from 'firebase-admin';
import { logger } from 'firebase-functions';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import { config } from './config';
import { updateUserSearchConfig } from './update-user-search-config';

const searchConfigRefreshCron = '0 0 */1 * *';

export const refreshUserSearchConfigsOnSchedule = onSchedule(
  {
    schedule: searchConfigRefreshCron,
    secrets: [
      config.algoliaApiKey,
    ],
  },
  async (event) => {
    const db = firestore();

    const currentDate = new Date(event.scheduleTime);

    const nextRunAt = CronExpressionParser.parse(
      searchConfigRefreshCron, {
      currentDate: currentDate,
    }).next().toDate();

    const snapshot = await db.collection('users')
      .where("searchConfig.validUntil", "<", nextRunAt)
      .get();

    const numberOfUsers = snapshot.size;

    if (numberOfUsers == 0) {
      logger.info('No user search configs to refresh before the next run', {
        numberOfUsers: numberOfUsers,
        nextRunAt: nextRunAt,
      });

      return;
    }

    logger.info('Found user search configs to refresh before the next run', {
      numberOfUsers: numberOfUsers,
      nextRunAt: nextRunAt,
    });

    const client = searchClient(
      config.algoliaAppId.value(),
      config.algoliaApiKey.value(),
    );

    await Promise.all(
      snapshot.docs.map(
        doc => updateUserSearchConfig(doc.id, client)
      )
    );

    logger.info('Refreshed user search configs', {
      numberOfUsers: numberOfUsers,
    });
  },
);
