@Tags(const ['aot'])
@TestOn('browser')

import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular_test/angular_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:angular2_components_test/login/login_component.dart';
import 'package:angular2_components_test/login/login_page_object.dart';
import 'package:angular2_components_test/services/login_service.dart';

@Injectable()
class MockLoginService extends Mock implements LoginService {}

@AngularEntrypoint()
void main() {
  tearDown(disposeAnyRunningTest);

  group("$LoginComponent", () {
    test("should properly fill username & password", () async {
      var username = "MyUsername";
      var password = "MyPassword";

      var loginService = new MockLoginService();
      when(loginService.login(username, password)).thenReturn(true);
      var testBed = new NgTestBed<LoginComponent>()
          .addProviders([materialProviders, provide(LoginService, useValue: loginService)]);
      var fixture = await testBed.create();

      LoginComponentPO page = await fixture.resolvePageObject(LoginComponentPO);

      await page.username(username);
      await fixture.update((LoginComponent lc) {
        lc.username = username;
      });

      await page.password(password);
      await fixture.update((LoginComponent lc) {
        lc.password = password;
      });
      await page.click();

      expect(true, await loginService.login(username, password));
    });
  });
}
