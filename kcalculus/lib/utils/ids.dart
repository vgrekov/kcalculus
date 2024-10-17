import 'package:uuid/uuid.dart';

final _uuid = Uuid();

String generateId() {
  return _uuid.v4();
}
