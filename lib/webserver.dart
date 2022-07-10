import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_server;
import 'service.dart';

void runServer() async {
  final service = Service();
  final server = await shelf_server.serve(service.handler, '127.0.0.1', 8080);

  print('server running : http://${server.address.host}:${server.port}');
}
