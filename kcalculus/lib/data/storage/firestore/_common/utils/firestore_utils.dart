import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculus/data/app_config/models/firestore_config.dart';

Future<void> batchDelete(
  Query query, {
  int? batchSize,
}) async {
  batchSize = batchSize ?? kDefaultDeleteBatchSize;

  query = query.orderBy(FieldPath.documentId).limit(batchSize);

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
