import 'package:delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:delivery_app/app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());
  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));

      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedExceptions catch (e, s) {
      emit(state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: 'Login ou senha inválidos !!'));
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: 'Erro ao realizar o login'));
    }
  }
}
