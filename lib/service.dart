import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:webserver/RequestData.dart';
import 'package:webserver/ResponseData.dart';
import 'login_api.dart';

class Service {
  Handler get handler {
    final router = Router();

    
    // GET :
    router.get('/', (Request request) async {
      await Future.delayed(Duration(milliseconds: 400));
      
      var b = resultPacket("success","this site for only mobile API." , "");
      return Response.ok(jsonEncode(b));
    });

    // GET : 경로명 처리
    router.get('/<req>', (Request request, String req) {
      var b = resultPacket("fail","your request $req not allowed." , "");
      return Response.ok(jsonEncode(b));
    });


    // 주의: 'router.all' 이전에 처리해야 함.
    // mount()는 주로 요청을 목적별(login, 화면, ..) 분류하기 위해 사용됨
    router.mount('/loginapi/', loginApi().router);

    // 요청을 찾지 못했을 경우
    router.all('/<ignored|.*>', (Request request) {
      var b = resultPacket("fail","request not found." , "");
      return Response.notFound(jsonEncode(b));
    });

    return router;
  }
}
