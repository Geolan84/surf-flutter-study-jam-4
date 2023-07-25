import 'package:surf_practice_magic_ball/domain/api_client/api_client.dart';


class ResponseRepository {
  final _apiClient = ApiClient();
  
  Future<String> getAnswer() async {
    final result = await _apiClient.getRandomResponse();
    return result;
  }
}