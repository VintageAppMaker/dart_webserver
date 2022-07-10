import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:webserver/RequestData.dart';
import 'package:webserver/ResponseData.dart';
import 'package:webserver/datamanager.dart';

import 'package:shelf_router/shelf_router.dart';

class loginApi {

  Router get router {
    final router = Router();

    router.post('/reg/', (Request request) async {
      final payload = await request.readAsString();
      
      try{
        
        // 요청분석
        var p = jsonDecode(payload);
        var d = ReqRegisterPacket.fromJson(p);
        
        // 실패했을 경우, 응답.
        var res = jsonEncode(resultPacket("success", "user is not registed(already registed).", "{}"));

        if (!DB.isExistData(d.user)){
          // 사용자 추가 
          var newItem = DataLogin(d.user, d.passwd, d.level);
          DB.add(newItem);

          // 응답처리 (data에 json 정보전달)
          res = jsonEncode(resultPacket("success", "ok", "${jsonEncode(newItem)}"));
          return Response.ok(res);
        }  

        return Response.ok(res);
      
      } catch(e){
        return Response.ok('$e');
      }
      
    });

    router.post('/login/', (Request request) async {
      final payload = await request.readAsString();
      
      try{
        // 요청분석
        var p = jsonDecode(payload);
        var d = ReqLoginPacket.fromJson(p);
        
        // 실패했을 경우, 응답.
        var res = jsonEncode(resultPacket("success", "user is not found.", "{}"));

        if (DB.isExistData(d.user)){
          
          // 응답처리
          if (DB.isPasswdOkByUser(d.user, d.passwd)){
            res = jsonEncode(resultPacket("success", "login ok", "{}"));
            return Response.ok(res); 
          }

        }  
        return Response.ok(res);
      
      } catch(e){
        return Response.ok('$e');
      }
      
    });
    
    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));
    return router;
  }
}
