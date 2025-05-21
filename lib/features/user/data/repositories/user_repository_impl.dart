import 'package:linkifoot/features/user/data/datasources/remote/user_remote_data_source.dart';
import 'package:linkifoot/features/user/domain/entities/user_entity.dart';
import 'package:linkifoot/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> createUser(UserEntity user) async =>
      remoteDataSource.createUser(user);

  @override
  Future<void> followUnFollowUser(UserEntity user) async =>
      remoteDataSource.followUnFollowUser(user);

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<void> signInUser(UserEntity user) async =>
      remoteDataSource.signInUser(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUpUser(UserEntity user) async =>
      remoteDataSource.signUpUser(user);

  @override
  Future<void> updateUser(UserEntity user) async =>
      remoteDataSource.updateUser(user);

  @override
  Stream<List<UserEntity>> getSingleOtherUser(String otherUid) {
    // TODO: implement getSingleOtherUser
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) =>
      remoteDataSource.getSingleUser(uid);

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) =>
      remoteDataSource.getUsers(user);
}
