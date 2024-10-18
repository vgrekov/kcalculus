import 'package:kcalculus/utils/ids.dart' as ids;

abstract class Identifiable {
  final String id;

  Identifiable({String? id}) : id = id ?? ids.generateId();
}
