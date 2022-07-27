abstract class ILocalStorage {
  Future<void> write(String key, String value);
  Future<void> deleteAll();
  Future<String?> read(String key);
}
