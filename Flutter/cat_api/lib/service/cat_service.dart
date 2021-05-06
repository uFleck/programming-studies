import 'package:cat_api/constant.dart';
import 'package:cat_api/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CatService {
  Future<Cat> getCat(String id) async {
    var url = Uri.https(Constant.BASE_URL, Constant.BREEDS_ENDPOINT + '$id');

    var response = await http.get(url, headers: {'x-api-key': '1d1b0bfe-4ea5-491c-ad21-a36240572e5b'});

    print(response.body);

    if(response.statusCode != 200)
      throw Exception();

    print(response.body);

    return parsedJson(response.body);
  }

  Cat parsedJson(final response) {
    return Cat.fromJson(convert.jsonDecode(response));
  }
}