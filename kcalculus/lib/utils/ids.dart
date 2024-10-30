import 'package:uuid/uuid.dart';

const _uuid = Uuid();

String generateId() {
  return _uuid.v4();
}
