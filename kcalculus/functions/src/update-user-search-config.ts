import {
  SearchClient,
  searchClient,
} from '@algolia/client-search';
import {
  FieldValue,
  getFirestore,
} from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';
import { config } from './config';

export async function updateUserSearchConfig(
  userId: string,
  client?: SearchClient,
): Promise<void> {
  logger.info('Updating user search config', {
    userId: userId,
  });

  client = client ?? searchClient(
    config.algoliaAppId.value(),
    config.algoliaApiKey.value(),
  );

  const now = new Date();
  const apiKeyTtl = config.searchConfigTtlSeconds.value();
  const validUntil = new Date(now.getTime() + apiKeyTtl * 1000);

  const apiKey = client.generateSecuredApiKey({
    parentApiKey: config.algoliaApiKey.value(),
    restrictions: {
      filters: `ownerId:${userId} AND deleted:false`,
      validUntil: Math.ceil(validUntil.getTime() / 1000),
    }
  });

  logger.info('Generated Algolia secured API KEY', {
    userId: userId,
    validUntil: validUntil,
  });

  const db = getFirestore();

  const doc = db.doc(`users/${userId}`);

  const docExists = (await doc.get()).exists;

  await doc.set(
    {
      searchConfig: {
        appId: config.algoliaAppId.value(),
        apiKey: apiKey,
        validUntil: validUntil,
      },
      ...(
        !docExists
        && {
          createdAt: FieldValue.serverTimestamp(),
          updatedAt: FieldValue.serverTimestamp(),
          deletedAt: null,
        }
      ),
    },
    {
      merge: true,
    }
  );

  logger.info('Updated user search config', {
    userId: userId,
  });
}
