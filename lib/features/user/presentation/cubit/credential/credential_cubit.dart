// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:linkifoot/features/user/domain/entities/user_entity.dart';

import 'package:linkifoot/features/user/domain/usecases/credential%20/sign_in_user_usecase.dart';
import 'package:linkifoot/features/user/domain/usecases/credential%20/sign_up_user_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUserUseCase signInUserUseCase;
  final SignUpUseCase signUpUseCase;
  CredentialCubit({
    required this.signInUserUseCase,
    required this.signUpUseCase,
  }) : super(CredentialInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await signInUserUseCase
          .call(UserEntity(email: email, password: password));
      emit(CredentialSuccess());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.call(user);
      emit(CredentialSuccess());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
