import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/services/api/app_exception.dart';

class ApiHelper {
  //get
  Future<dynamic> getApi({required String url}) async {
    try {
      final String endpoint = '$url&apiKey=${AppConstants.API_KEY}';
      //print(endpoint);
      var res = await http.get(Uri.parse(endpoint));
      return returnResponse(res);
      // ignore: unused_catch_clause
    } on SocketException catch (e) {
      throw NoInternetException(msg: "Not connected to internet");
    } catch (e) {
      throw MyException(title: "Something went wrong", message: e.toString());
    }
  }

  //post
  dynamic returnResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body);
      case 400:
        throw BadRequestException(msg: "Bad Request");
      case 401:
        throw UnauthorizedException(msg: "Unauthorise");
      case 404:
        throw NotFoundException(msg: "Not Found");
      case 500:
      default:
        throw ServerException(msg: "Internal Server Error");
    }
  }
}
