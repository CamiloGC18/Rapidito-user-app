import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rapidito_user/data/api_client.dart';
import 'package:rapidito_user/features/notification/domain/repositories/notification_repository_interface.dart';
import 'package:rapidito_user/util/app_constants.dart';

class NotificationRepository implements NotificationRepositoryInterface{
  final ApiClient apiClient;
  NotificationRepository({required this.apiClient});

  @override
  Future<Response> getList({int? offset = 1}) async {
    return await apiClient.getData('${AppConstants.notificationList}$offset');
  }

  @override
  Future<Response> sendReadStatus(int notificationId) async {
    return await apiClient.putData(AppConstants.readNotification, {"notification_id" : notificationId});
  }

  @override
  Future add(value) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future update(value, {int? id}) {
    // TODO: implement update
    throw UnimplementedError();
  }


}