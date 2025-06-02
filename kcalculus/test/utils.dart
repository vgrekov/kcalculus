import 'dart:io';

Future<String> loadFixture(String path) async {
  final file = File(path);
  return file.readAsString();
}
