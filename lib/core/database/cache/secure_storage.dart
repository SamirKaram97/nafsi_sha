import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = FlutterSecureStorage(
    iOptions: getIOSOptions(),
    aOptions: getAndroidOptions(),
  );

  static IOSOptions getIOSOptions() => const IOSOptions();

  static AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    switch (value.runtimeType) {
      case String:
        await storage.write(
          key: key,
          value: '$value&@&@!${value.runtimeType}',
        );
        break;
      case bool:
        await storage.write(
          key: key,
          value: value == true
              ? '1&@&@!${value.runtimeType}'
              : '0&@&@!${value.runtimeType}',
        );
        break;
      case int:
        await storage.write(
          key: key,
          value: '$value&@&@!${value.runtimeType}',
        );
        break;
      case double:
        await storage.write(
          key: key,
          value: '$value&@&@!${value.runtimeType}',
        );
        break;
    }
  }

  static Future<dynamic> getData({
    required String key,
  }) async {
    String? valueRead = await storage.read(
      key: key,
    );
    if (valueRead != null) {
      String value = valueRead.split('&@&@!')[0];
      String valueType = valueRead.split('&@&@!')[1];
      switch (valueType) {
        case 'String':
          return value;
        case 'bool':
          return value == '1' ? true : false;
        case 'int':
          return int.parse(value);
        case 'double':
          return double.parse(value);
      }
    }
    return null;
  }

  static Future<void> removeData({
    required String key,
  }) async {
    return await storage.delete(
      key: key,
    );
  }

  static Future<void> removeAllData() async {
    return await storage.deleteAll();
  }
}
