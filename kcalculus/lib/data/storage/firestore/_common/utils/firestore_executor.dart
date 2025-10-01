import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class FirestoreExecutor {
  factory FirestoreExecutor([Transaction? txn]) {
    return txn == null ? const _DirectExecutor() : _TransactionExecutor(txn);
  }

  Future<DocumentSnapshot<T>> get<T>(
    DocumentReference<T> ref,
  );

  Future<void> set<T>(
    DocumentReference<T> ref,
    T data, {
    SetOptions? options,
  });

  Future<void> update(
    DocumentReference<Object?> ref,
    Map<String, dynamic> data,
  );

  Future<void> delete(
    DocumentReference<Object?> ref,
  );
}

class _DirectExecutor implements FirestoreExecutor {
  const _DirectExecutor();

  @override
  Future<DocumentSnapshot<T>> get<T>(
    DocumentReference<T> ref,
  ) {
    return ref.get();
  }

  @override
  Future<void> set<T>(
    DocumentReference<T> ref,
    T data, {
    SetOptions? options,
  }) {
    return ref.set(data, options);
  }

  @override
  Future<void> update(
    DocumentReference<Object?> ref,
    Map<String, dynamic> data,
  ) {
    return ref.update(data);
  }

  @override
  Future<void> delete(
    DocumentReference<Object?> ref,
  ) {
    return ref.delete();
  }
}

class _TransactionExecutor implements FirestoreExecutor {
  _TransactionExecutor(this.txn);

  final Transaction txn;

  @override
  Future<DocumentSnapshot<T>> get<T>(
    DocumentReference<T> ref,
  ) {
    return txn.get(ref);
  }

  @override
  Future<void> set<T>(
    DocumentReference<T> ref,
    T data, {
    SetOptions? options,
  }) async {
    txn.set(ref, data, options);
  }

  @override
  Future<void> update(
    DocumentReference<Object?> ref,
    Map<String, dynamic> data,
  ) async {
    txn.update(ref, data);
  }

  @override
  Future<void> delete(
    DocumentReference<Object?> ref,
  ) async {
    txn.delete(ref);
  }
}
