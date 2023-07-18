import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHepler {
  var url;
  NetworkHepler({this.url});
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
