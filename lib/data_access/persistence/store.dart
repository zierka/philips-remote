abstract class Store {
  Future<void> saveString(String key, String? value);
  Future<String?> string(String key);

  Future<void> saveObject(String key, Map<String, dynamic>? object);
  Future<Map<String, dynamic>?> object(String key);
}
