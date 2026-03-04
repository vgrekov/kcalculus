import {
  getFirestore,
} from 'firebase-admin/firestore';
import { logger } from 'firebase-functions';

const batchSize = 500;

export async function purgeUser(
  userId: string,
): Promise<void> {
  logger.info('Purging user...', {
    userId: userId,
  });

  const db = getFirestore();

  const writer = db.bulkWriter();

  await deleteEdibles(db, writer, userId);

  await deleteContainers(db, writer, userId);

  await deleteUserData(db, writer, userId);

  await writer.close();

  logger.info('Purged user', {
    userId: userId,
  });
}

async function deleteEdibles(
  db: FirebaseFirestore.Firestore,
  writer: FirebaseFirestore.BulkWriter,
  userId: string,
): Promise<void> {
  logger.info('Deleting user edibles...', {
    userId: userId,
  });

  await deleteQueryResults(
    writer,
    db
      .collection('edibles')
      .where('ownerId', '==', userId),
  );

  logger.info('Deleted user edibles', {
    userId: userId,
  });
}

async function deleteContainers(
  db: FirebaseFirestore.Firestore,
  writer: FirebaseFirestore.BulkWriter,
  userId: string,
): Promise<void> {
  logger.info('Deleting user containers...', {
    userId: userId,
  });

  await deleteQueryResults(
    writer,
    db
      .collection('foodContainers')
      .where('ownerId', '==', userId),
  );

  logger.info('Deleted user containers', {
    userId: userId,
  });
}

async function deleteUserData(
  db: FirebaseFirestore.Firestore,
  writer: FirebaseFirestore.BulkWriter,
  userId: string,
): Promise<void> {
  logger.info('Deleting user data...', {
    userId: userId,
  });

  const userRef = db.collection('users').doc(userId);

  const subCollections = await userRef.listCollections();

  await Promise.all(
    subCollections.map(
      (sc) => deleteQueryResults(writer, sc),
    ),
  );

  writer.delete(userRef);

  logger.info('Deleted user data', {
    userId: userId,
  });
}

async function deleteQueryResults(
  writer: FirebaseFirestore.BulkWriter,
  query: FirebaseFirestore.Query,
): Promise<void> {
  let snapshot;

  do {
    snapshot = await query
      .orderBy('__name__')
      .limit(batchSize)
      .get();

    if (snapshot.empty) break;

    snapshot.docs.forEach(
      (doc) => {
        writer.delete(doc.ref);
      },
    );

    await writer.flush();
  } while (snapshot.size === batchSize);
}
