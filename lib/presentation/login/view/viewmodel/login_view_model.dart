import 'dart:async';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/common/freezed%20_data_classes.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("", "");

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isUserPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isUserPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }
}

abstract class LoginViewModelInput {
  login();

  setUserName(String userName);
  setPassword(String password);

  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
}
