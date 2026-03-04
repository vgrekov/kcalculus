import {
  getApps,
  initializeApp,
} from 'firebase-admin/app';

if (!getApps().length) {
  initializeApp();
}

export { updateUserSearchConfigOnCreate } from './auth-on-user-created';
export { purgeUserOnDelete } from './auth-on-user-deleted';
export { refreshUserSearchConfigsOnSchedule } from './scheduled';

