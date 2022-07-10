import 'dart:convert';

// 사용자 등록
class ReqRegisterPacket{
  String user;
  String passwd;
  int    level;
  
  ReqRegisterPacket(this.user, this.passwd, this.level);

  // jsondecode()를 사용할 경우, 반드시 필요한 Function
  // 이것이 없으면 캐스팅 에러가 발생함
  ReqRegisterPacket.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        passwd = json['passwd'], 
        level = json['level'];
}

// 로그인
class ReqLoginPacket{
  String user;
  String passwd;
  
  ReqLoginPacket(this.user, this.passwd);

  // jsondecode()를 사용할 경우, 반드시 필요한 Function
  // 이것이 없으면 캐스팅 에러가 발생함
  ReqLoginPacket.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        passwd = json['passwd'];
}


