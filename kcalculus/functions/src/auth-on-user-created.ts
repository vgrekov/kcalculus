import * as functions from 'firebase-functions/v1';
import { config } from './config';
import { updateUserSearchConfig } from './update-user-search-config';

export const updateUserSearchConfigOnCreate = functions
  .runWith({
    secrets: [
      config.algoliaApiKey,
    ],
  })
  .auth
  .user()
  .onCreate(
    (user) => updateUserSearchConfig(user.uid)
  );
