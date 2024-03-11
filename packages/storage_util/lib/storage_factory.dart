import "package:flutter_secure_storage/flutter_secure_storage.dart";

import "local_storage.dart";
import "secure_storage.dart";
import "storage.dart";

/// This class is point-of-contact for Either use
/// [LocalStorage] or [SecureStorage] based on [isSecure] flag
class StorageFactory {
  /// This method provides a [Storage] Either we get
  /// [LocalStorage] or [SecureStorage] based on [isSecure] flag
  ///
  /// [isSecure] Decide which type of storage do we want
  /// [boxName] Box name for [Hive] this box name should match with [createBox] boxName
  ///
  /// This is how we can use this at call site
  /// Example,
  /// StorageFactory.getStorage(isSecure: false, boxName: "catalyst"),
  /// StorageFactory.getStorage(isSecure: true)
  static Storage getStorage({
    required bool isSecure,
    String? boxName,
  }) {
    if (isSecure) {
      return SecureStorage(const FlutterSecureStorage());
    } else {
      return LocalStorage(boxName!);
    }
  }
}
