import {
  defineInt,
  defineSecret,
  defineString,
} from 'firebase-functions/params';

export const config = {
  algoliaAppId: defineString('ALGOLIA_APP_ID'),
  algoliaApiKey: defineSecret('ALGOLIA_API_KEY'),
  searchConfigTtlSeconds: defineInt('SEARCH_CONFIG_TTL_SECONDS'),
};
