import * as functions from 'firebase-functions/v1';
import { purgeUser } from './purge-user';

export const purgeUserOnDelete = functions
  .runWith({
    timeoutSeconds: 540,
    memory: '512MB',
  })
  .auth
  .user()
  .onDelete(
    (user) => purgeUser(user.uid)
  );
