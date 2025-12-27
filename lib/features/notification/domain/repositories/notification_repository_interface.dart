import 'package:rapidito_user/interface/repository_interface.dart';

abstract class NotificationRepositoryInterface implements RepositoryInterface{
  Future<dynamic> sendReadStatus(int notificationId);
}