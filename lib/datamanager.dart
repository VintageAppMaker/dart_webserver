
import 'package:webserver/ResponseData.dart';

class SimpleDBManager{
  var db = <DataLogin>[];
  
  void add (DataLogin d) => db.add(d);

  bool isExistData (String user){
    var b = db.firstWhere((d) => d.user == user, orElse: () => DataLogin("", "", 0));
    return b.user != "";
  }

  bool isPasswdOkByUser (String user, String passwd){
    var b = db.firstWhere((d) => d.user == user, orElse: () => DataLogin("", "",  0));
    return b.passwd == passwd;
  }
}
  
var DB = SimpleDBManager();