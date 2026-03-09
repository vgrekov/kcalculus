import { getAuth } from "firebase-admin/auth";
import {
  getFirestore,
} from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';

export async function sendEmailVerification(
  email: string,
  locale: string = 'en',
): Promise<void> {
  try {
    const actionLink = await getAuth()
      .generateEmailVerificationLink(email);

    logger.info('Sending email verification', {
      email,
      locale,
    });

    await sendEmailFromTemplate(
      email,
      'verifyEmail',
      locale,
      {
        actionLink: actionLink,
      }
    );

    logger.info('Sent email verification', {
      email,
      locale,
    });
  } catch (error) {
    logger.error('Failed to send email verification', {
      email,
      locale,
      error,
    });

    throw error;
  }
}

export async function sendPasswordResetEmail(
  email: string,
  locale: string = 'en',
): Promise<void> {
  try {
    logger.info('Sending password reset email', {
      email,
      locale,
    });

    const actionLink = await getAuth()
      .generatePasswordResetLink(email);

    await sendEmailFromTemplate(
      email,
      'resetPassword',
      locale,
      {
        actionLink: actionLink,
      }
    );

    logger.info('Sent password reset email', {
      email,
      locale,
    });
  } catch (error) {
    logger.error('Failed to send password reset email', {
      email,
      locale,
      error,
    });

    throw error;
  }
}

export async function sendAccountDeletedEmail(
  email: string,
  locale: string = 'en',
): Promise<void> {
  try {
    logger.info('Sending account deleted email', {
      email,
      locale,
    });

    await sendEmailFromTemplate(
      email,
      'accountDeleted',
      locale,
    );

    logger.info('Sent account deleted email', {
      email,
      locale,
    });
  } catch (error) {
    logger.error('Failed to send account deleted email', {
      email,
      locale,
      error,
    });

    throw error;
  }
}

async function sendEmailFromTemplate(
  to: string,
  template: string,
  locale: string,
  data: object = {},
): Promise<void> {
  const db = getFirestore();

  const themeSnapshot = await db
    .collection('mailTemplates')
    .doc('_theme_')
    .get();

  const theme = themeSnapshot.data();

  await db
    .collection('mail')
    .add({
      to: [to],
      template: {
        name: `${template}_${locale.toLowerCase()}`,
        data: {
          theme: theme,
          ...data,
        },
      },
    });
}
