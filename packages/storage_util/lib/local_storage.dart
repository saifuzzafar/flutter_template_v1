import "package:hive/hive.dart";
import "package:hive_flutter/hive_flutter.dart";

import "storage.dart";

/// [LocalStorage] is implementing [Storage]
/// This class stores all types of object and variables in [Hive]
/// Also this class get all types of object and variables from [Hive]
class LocalStorage implements Storage {
  Box? box;

  LocalStorage(String boxName) {
    box = Hive.box(boxName);
  }

  @override
  void setItem({required String key, required String value}) async {
    await box?.put(key, value);
  }

  @override
  void setCustomItem<T>({required String key, required T value}) async {
    await box?.put(key, value);
  }

  @override
  void setIntItem({required String key, required int value}) async {
    await box?.put(key, value);
  }

  @override
  void setDoubleItem({required String key, required double value}) async {
    await box?.put(key, value);
  }

  @override
  void setBoolItem({required String key, required bool value}) async {
    await box?.put(key, value);
  }

  @override
  void clear() {
    box?.clear();
  }

  @override
  void deleteItem({required String key}) {
    box?.delete(key);
  }

  @override
  Future<Map<String, String>?> getAllItem() {
    return Future.value(box?.toMap() as Map<String, String>);
  }

  @override
  Future<String?> getItem({required String key}) async {
    return await box?.get(key);
  }

  @override
  Future<bool?> getBoolItem({required String key}) async {
    return await box?.get(key);
  }

  @override
  Future<int?> getIntItem({required String key}) async {
    return await box?.get(key);
  }

  @override
  Future<double?> getDoubleItem({required String key}) async {
    return await box?.get(key);
  }

  @override
  Future<T?> getCustomItem<T>({required String key}) async {
    return await box?.get(key);
  }
}
