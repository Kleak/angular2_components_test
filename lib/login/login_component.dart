import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2_components_test/services/login_service.dart';

@Component(
  selector: 'my-login',
  templateUrl: 'login_component.html',
  directives: const [materialDirectives],
  providers: const [LoginService],
)
class LoginComponent implements OnInit {
  final LoginService _loginService;
  String username;
  String password;


  LoginComponent(this._loginService);

  ngOnInit() {}

  void login() {
    _loginService.login(username, password);
  }
}
