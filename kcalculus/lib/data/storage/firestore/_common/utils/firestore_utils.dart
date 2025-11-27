import 'package:cloud_firestore/cloud_firestore.dart';

const int kMaxBatchSize = 500;

Future<void> batchDelete(Query query) async {
  query = query.orderBy(FieldPath.documentId).limit(kMaxBatchSize);

  while (true) {
    final snapshot = await query.get();

    if (snapshot.size == 0) return;

    final batch = FirebaseFirestore.instance.batch();

    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}
