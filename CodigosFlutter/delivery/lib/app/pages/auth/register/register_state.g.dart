// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RegisterStatusMatch on RegisterStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() register,
      required T Function() sucess,
      required T Function() erro}) {
    final v = this;
    if (v == RegisterStatus.initial) {
      return initial();
    }

    if (v == RegisterStatus.register) {
      return register();
    }

    if (v == RegisterStatus.sucess) {
      return sucess();
    }

    if (v == RegisterStatus.erro) {
      return erro();
    }

    throw Exception('RegisterStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? register,
      T Function()? sucess,
      T Function()? erro}) {
    final v = this;
    if (v == RegisterStatus.initial && initial != null) {
      return initial();
    }

    if (v == RegisterStatus.register && register != null) {
      return register();
    }

    if (v == RegisterStatus.sucess && sucess != null) {
      return sucess();
    }

    if (v == RegisterStatus.erro && erro != null) {
      return erro();
    }

    return any();
  }
}
