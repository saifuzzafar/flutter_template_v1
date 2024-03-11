Storage Util
===
Storage Util is responsible for storing any type of data into storage based on key value mechanism.

## Code Details
- **Storage Factory**  
  Storage Factory is responsible for providing Instance of LocalStorage or Secure Storage based on Usecase.

- **Local Storage**  
  Local Storage is internally using Hive. Where we able to put all basic data types such as **String, int, double, bool, CustomObject**

- **Flutter Secure Storage**  
  Flutter Secure Storage is provide secure storage across platforms. Where we able to put all basic data types such as **String, int, double, bool, CustomObject**. By default it only supports String while put and get. But we are performed conversion to put and get other types as well.

## Initialization
Before using Storage we should initialize Hive at top level, before run app like mention.
```
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await createBox(BoxName.  distributorAppBoxName);
  runApp(MyApp(flavor: flavor));

```
- initHive()  
  Init hive is responsible for initialize Hive.  So Local Storage will work seamlessly.

- createBox()
  Create box is responsible for Creating Box in Hive. So Local storage will put all it's values inside same box using key.

## Use

- Create Local Storage
  ```
  StorageFactory.getStorage(isSecure: false, boxName: <boxName>);  

  ```
- Create Secure Storage
  ```
  StorageFactory.getStorage(isSecure: true, boxName: <boxName>);

  ```
- Put Data into Storage
  ```
  final storage = StorageFactory.getStorage(isSecure: false, boxName: <boxName>)
  storage.setItem("key", "test");  
  
  final secureStorage = StorageFactory.getStorage(isSecure: true, boxName: <boxName>)
  secureStorage.setItem("key", "test");

  ```
- Get Data from Storage
  ```
  final storage = StorageFactory.getStorage(isSecure: true, boxName: <boxName>);
  storage.getItem("key", "test");  
  
  
  final secureStorage = StorageFactory.getStorage(isSecure: true, boxName: <boxName>)
  secureStorage.getItem("key");

  ```  


## References
- [Hive Dependency](https://pub.dev/packages/hive_flutter/install)
- [Hive Documentation](https://docs.hivedb.dev/#/README)
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)