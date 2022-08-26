import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;
    setUpAll(
      () async {
        driver = await FlutterDriver.connect();
      },
    );

    tearDown(
      () {
        if (driver != null) {
          driver.close();
        }
      },
    );

    final filedFinderPhone = find.byValueKey('PhoneField');
    final filedFinderSubmit = find.text('Отправить');
    final filedFinderEmail = find.byValueKey('EmailField');

    test('Login form', () async {

      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89123449090');
      await driver.waitFor(find.text('89123449090'));

      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('text@test.com');
      await driver.waitFor(find.text('text@test.com'));

      await driver.tap(filedFinderSubmit);

      final successMessage = find.text('Добро пожаловать');
      expect(await driver.getText(successMessage), 'Добро пожаловать');

      await Future.delayed(const Duration(seconds: 3));
    });
   
  });
  group('Register form tests', () {
    late FlutterDriver driver;
    setUpAll(
      () async {
        driver = await FlutterDriver.connect();
      },
    );

    tearDown(
      () {
        if (driver != null) {
          driver.close();
        }
      },
    );

    final filedFinderPhone = find.byValueKey('PhoneField');
    final filedFinderFirstName = find.byValueKey('FirstNameField');
    final filedFinderLastName = find.byValueKey('LastNameField');
    final filedFinderSubmit = find.byValueKey('SubmitButton');
    final filedFinderEmail = find.byValueKey('EmailField');
    final filedFinderButtonRegister = find.byValueKey('ChangeForm');

    test('Register form', () async {

      await driver.tap(filedFinderButtonRegister);

      final formLabel = find.text('Регистрация');
      expect(await driver.getText(formLabel), 'Регистрация');


      await driver.tap(filedFinderFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Ибрахим');
      await driver.waitFor(find.text('Ибрахим'));

      await driver.tap(filedFinderLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Зиатдинов');
      await driver.waitFor(find.text('Зиатдинов'));
      
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89123449090');
      await driver.waitFor(find.text('89123449090'));

      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('text@test.com');
      await driver.waitFor(find.text('text@test.com'));

      await driver.tap(filedFinderSubmit);

      final successMessage = find.text('Вы успешно зарегистрировались');
      expect(await driver.getText(successMessage), 'Вы успешно зарегистрировались');

      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
