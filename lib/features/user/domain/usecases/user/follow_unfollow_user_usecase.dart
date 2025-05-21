import 'package:linkifoot/features/user/domain/entities/user_entity.dart';
import 'package:linkifoot/features/user/domain/repositories/user_repository.dart';

class FollowUnFollowUseCase {
  final UserRepository repository;

  FollowUnFollowUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.followUnFollowUser(user);
  }
}
