import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const link = 'https://eightballapi.com/api';

  Future<String> getRandomResponse() async {
    var url = Uri.parse(link);
    var response = await http.get(url, headers:{"content-type":"application/json"}).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data["reading"];
    } else {
      throw Exception("Bad response");
    }
  }
}
