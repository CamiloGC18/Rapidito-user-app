import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rapidito_user/data/api_client.dart';
import 'package:rapidito_user/features/my_level/domain/repositories/level_repository_interface.dart';
import 'package:rapidito_user/util/app_constants.dart';

class LevelRepository implements LevelRepositoryInterface{
  ApiClient apiClient;
  LevelRepository({required this.apiClient});

  @override
  Future<Response> getProfileLevelInfo() async{
    return apiClient.getData(AppConstants.getProfileLevel);
  }

}