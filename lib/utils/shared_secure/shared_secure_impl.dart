import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:patient_front_end/utils/shared_secure/shared_secure.dart';

class SharedSecureImpl extends ILocalStorage {
  final storage = const FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    try {
      return await storage.write(key: key, value: value);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      return await storage.deleteAll();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await storage.read(key: key);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
