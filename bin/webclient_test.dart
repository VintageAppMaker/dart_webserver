import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:webserver/RequestData.dart';
import 'package:webserver/ResponseData.dart';

Future<void> main(List<String> arguments) async {
  testRegisterUser();
  testLoginUser();
}

var host = "http://127.0.0.1:8080";

void testLoginUser() async {
  try {
    var req = jsonEncode(ReqLoginPacket("user1", "1234"));

    var dio = Dio();
    Response response = await dio.post("${host}/loginapi/login/",
        data: req,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

    if (response.statusCode != 200) return;

    var res = resultPacket.fromJson(jsonDecode(response.toString()));
    print("result => ${res.result} msg => ${res.msg} data => ${res.data} ");
  } catch (error, stackTrace) {
    print("Exception occurred: $error  stackTrace: $stackTrace");
    return;
  }
}

void testRegisterUser() async {
  try {
    var req = jsonEncode(ReqRegisterPacket("user1", "1234", 10));

    var dio = Dio();
    Response response = await dio.post("${host}/loginapi/reg/",
        data: req,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

    if (response.statusCode != 200) return;

    var res = resultPacket.fromJson(jsonDecode(response.toString()));
    print("result => ${res.result} msg => ${res.msg} data => ${res.data} ");
    if (res.data != "{}") {
      var res2 = ReqRegisterPacket.fromJson(jsonDecode(res.data));
      print("user => ${res2.user}");
    }
  } catch (error, stackTrace) {
    print("Exception occurred: $error  stackTrace: $stackTrace");
    return;
  }
}
