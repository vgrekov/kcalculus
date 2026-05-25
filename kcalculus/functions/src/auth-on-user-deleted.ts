import * as functions from 'firebase-functions/v1';
import { sendAccountDeletedEmail } from './messaging';
import { purgeUser } from './purge-user';

export const purgeUserOnDelete = functions
  .runWith({
    timeoutSeconds: 540,
    memory: '512MB',
  })
  .auth
  .user()
  .onDelete(
    async (user) => {
      await purgeUser(user.uid);

      if (user.email != null) {
        await sendAccountDeletedEmail(user.email);
      }
    }
  );
