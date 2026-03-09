import { FirebaseError } from 'firebase-admin';
import { HttpsError, onCall } from 'firebase-functions/v2/https';
import * as msg from './messaging';


export const sendEmailVerification = onCall(
  {
    enforceAppCheck: true,
  },
  async (request) => {
    if (request.auth == null) {
      throw new HttpsError('unauthenticated', 'User must be logged in.');
    }

    const email = request.data?.email;

    if (typeof email !== 'string' || email.length === 0) {
      throw new HttpsError('invalid-argument', 'Email must be provided.');
    }

    if (request.auth.token.email?.toLowerCase() !== email.toLowerCase()) {
      throw new HttpsError('unauthenticated', 'User email mismatch.');
    }

    try {
      await msg.sendEmailVerification(email);
    } catch (error) {
      throw new HttpsError('internal', 'Failed to send email verification.', {
        causeCode: isFirebaseError(error) ? error.code : null,
      });
    }
  }
);

export const sendPasswordResetEmail = onCall(
  {
    enforceAppCheck: true,
  },
  async (request) => {
    const email = request.data?.email;

    if (typeof email !== 'string' || email.length === 0) {
      throw new HttpsError('invalid-argument', 'Email must be provided.');
    }

    try {
      await msg.sendPasswordResetEmail(email);
    } catch (error) {
      throw new HttpsError('internal', 'Failed to send password reset email.', {
        causeCode: isFirebaseError(error) ? error.code : null,
      });
    }
  }
);

function isFirebaseError(error: any): error is FirebaseError {
  return error && typeof error.code === 'string' && typeof error.message === 'string';
}