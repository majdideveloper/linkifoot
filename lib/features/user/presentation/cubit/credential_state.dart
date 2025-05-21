part of 'credential_cubit.dart';

@freezed
class CredentialState with _$CredentialState {
  const factory CredentialState.initial() = _Initial;
  const factory CredentialState.loading() = _Loading;
  const factory CredentialState.loaded() = _Loaded;
  const factory CredentialState.error() = _Error;
}
