import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/model/travel_tab_model.dart';

const URL = 'http://www.devio.org/io/flutter_app/json/travel_page.json';

// var
class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelTabModel.fromJson(result);
    } else {
      throw Exception('Fail');
    }
  }
}
