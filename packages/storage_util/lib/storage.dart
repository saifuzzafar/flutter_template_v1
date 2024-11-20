import "dart:convert";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:storage_util/local_storage.dart";
import "package:storage_util/model/movie_db_entity.dart";
import "package:storage_util/secure_storage.dart";

/// Storage is prototype/blueprint for [LocalStorage] and [SecureStorage]
abstract class Storage {
  /// Set String item to Storage
  void setItem({required String key, required String value});

  /// Set int item to Storage
  void setIntItem({required String key, required int value});

  /// Set bool item to Storage
  void setBoolItem({required String key, required bool value});

  /// Set bool item to Storage
  void setDoubleItem({required String key, required double value});

  /// Set Custom object item to Storage
  /// Before calling this method mandatory call [registerAdapter] method
  /// This method only work with [Hive]
  /// For [FlutterSecureStorage] use [setItem] method with [jsonEncode]
  /// and [getItem] method with [jsonDecode]
  /// Then call [setCustomItem] method
  Future<void> setCustomItem<T>({required String key, required T value});

  /// Get String item from Storage
  Future<String?> getItem({required String key});

  /// Get int item from Storage
  Future<int?> getIntItem({required String key});

  /// Get bool item from Storage
  Future<bool?> getBoolItem({required String key});

  /// Get bool item from Storage
  Future<double?> getDoubleItem({required String key});

  /// Get bool item from Storage
  Future<T?> getCustomItem<T>({required String key});

  /// Get all Map item from Storage
  Future<Map<String, String>?> getAllItem();

  /// Delete respective item based on key from Storage
  Future<void> deleteItem({required String key});

  /// Clear Storage
  void clear();
}

/// This method is initialize Hive
/// And This method should called before calling runApp
///
/// For example,
/// void main() async {
///   await initHive();
///   await createBox("pharmarack");

///   runApp(MyApp());
/// }
Future<void> initHive() {
  return Hive.initFlutter();
}

/// This method is createBox in Hive
/// Opens a box.
///
/// If the box is already create, the instance is returned and all provided
/// parameters are being ignored.
///
/// And This method should called before calling runApp
/// For example,
/// void main() async {
///   await initHive();
///   await createBox("pharmarack");
///
///   runApp(MyApp());
/// }
///[boxName] : Unique name of the box
Future<void> createBox(String boxName) {
  _registerAdapters();
  return Hive.openBox(boxName);
}

/// This method always call before [Hive].openBox() and before putting data
/// inside [Storage.setCustomItem]
///
/// Register adapter to the hive storage
/// This method only work with [Hive]
/// For [FlutterSecureStorage] use [setItem] method with [jsonEncode]
/// and [getItem] method with [jsonDecode]
///
/// How can we use [registerAdapters] see below Example,
///
/// import 'package:hive/hive.dart';
/// part 'bank_account.g.dart';
/// @HiveType(typeId: 1)
/// class BankAccount {
///   @HiveField(0)
///   final String currency;
///
///   @HiveField(1)
///   final int myMoney;
///
///   BankAccount(this.currency, this.myMoney);
/// }
///
/// After running melos run build_runner command it generate Adapter for BankAccount class
/// pass that adapter as GenericType in [registerAdapter] mathod
///
/// void myFunction() {
///    registerAdapter<BankAccountAdapter>()
///    await createBox("pharmarack");
///    StorageFactory.getStorage(isSecure: false, boxName: <boxName>).[setCustomItem] ("bankAccount", BankAccount("\₹INR", 31000))
///    StorageFactory.getStorage(isSecure: false, boxName: <boxName>).[getCustomItem] ("bankAccount")
///
/// Note: Kindly put all Adapter here itself because this is already get called before
/// opening box using hive
/// }
void _registerAdapters() {
  Hive.registerAdapter<MovieDbEntity>(MovieDbEntityAdapter());
}
