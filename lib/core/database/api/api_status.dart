import 'package:hive_flutter/hive_flutter.dart';



part 'api_status.g.dart';
@HiveType(typeId: 1)
enum APIStatus {
  @HiveField(0)
  none,
  @HiveField(1)
  loading,
  @HiveField(2)
  success,
  @HiveField(3)
  error,
}


extension APIStatusExtension on APIStatus {
  bool get isLoading => this == APIStatus.loading;

  bool get isNone => this == APIStatus.none;

  bool get isSuccess => this == APIStatus.success;

  bool get isError => this == APIStatus.error;
}

APIStatus apiStatusFromJson(String? json) {
  switch (json) {
    case 'none':
      return APIStatus.none;
    case 'loading':
      return APIStatus.loading;
    case 'success':
      return APIStatus.success;
    case 'error':
      return APIStatus.error;
    default:
      return APIStatus.none;
  }
}
String apiStatusToJson(APIStatus status) {
  switch (status) {
    case APIStatus.none:
      return 'none';
    case APIStatus.loading:
      return 'loading';
    case APIStatus.success:
      return 'success';
    case APIStatus.error:
      return 'error';
  }
}






