import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "storage.dart";

/// [SecureStorage] is implementing [Storage]
/// This class stores all types of variables in [FlutterSecureStorage]
/// Also this class get all types of object and variables from [FlutterSecureStorage]
class SecureStorage implements Storage {
  late final FlutterSecureStorage secureStorage;

  SecureStorage(this.secureStorage);

  @override
  void clear() {
    secureStorage.deleteAll();
  }

  @override
  Future<void> deleteItem({required String key}) async {
    secureStorage.delete(key: key);
  }

  @override
  Future<Map<String, String>?> getAllItem() async {
    return await secureStorage.readAll();
  }

  @override
  Future<void> setCustomItem<T>({required String key, required T value}) {
    throw Exception(
        "Secure Storage is not have CustomObject support it present only as part of LocalStorage."
        "if want to put custom object kindly use setItem with jsonEncode");
  }

  @override
  Future<String?> getItem({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<bool?> getBoolItem({required String key}) async {
    String value = await secureStorage.read(key: key) ?? "false";
    return bool.parse(value);
  }

  @override
  Future<int?> getIntItem({required String key}) async {
    String value = await secureStorage.read(key: key) ?? "0";
    return int.parse(value);
  }

  @override
  Future<double?> getDoubleItem({required String key}) async {
    String value = await secureStorage.read(key: key) ?? "0";
    return double.parse(value);
  }

  @override
  Future<T?> getCustomItem<T>({required String key}) {
    throw Exception(
        "Secure Storage is not have CustomObject support it present only as part of LocalStorage."
        "if want to get custom object kindly use getItem with jsonDecode");
  }

  @override
  void setItem({required String key, required String value}) {
    secureStorage.write(key: key, value: value);
  }

  @override
  void setIntItem({required String key, required int value}) {
    secureStorage.write(key: key, value: value.toString());
  }

  @override
  void setBoolItem({required String key, required bool value}) {
    secureStorage.write(key: key, value: value.toString());
  }

  @override
  void setDoubleItem({required String key, required double value}) {
    secureStorage.write(key: key, value: value.toString());
  }
}
