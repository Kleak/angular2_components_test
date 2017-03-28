import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:angular2/core.dart';

const String _url = "https://www.example.com";

@Injectable()
class LoginService {
  final _client = new BrowserClient();

  LoginService();

  Future<Null> login(String username, String password) async {
    var response = await _client.post(_url,
        body: JSON.encode({
          "username": username,
          "password": password,
        }));
    return response.body;
  }
}
