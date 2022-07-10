import 'dart:convert';

class BasicPacket{
  String result;
  String msg;
  String data; // 요청에 대한 다양한 Json packet
  
  BasicPacket(this.result, this.msg, this.data);

  // jsonencode()를 사용할 경우, 반드시 필요한 Function
  Map toJson() => {
        'result': result,
        'msg': msg,
        'data': data
  };
}

// 로그인 정보, 클라이언트에 전달
class DataLogin{
  String user;
  String passwd; 
  int    level; // 요청에 대한 다양한 Json packet
  
  DataLogin(this.user, this.passwd, this.level);

  // jsonencode()를 사용할 경우, 반드시 필요한 Function
  Map toJson() => {
        'user': user,
        'passwd': passwd, 
        'msg' : level 
  };
}

