import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:linkifoot/core/utils/logger.dart';

import 'package:linkifoot/features/user/domain/entities/user_entity.dart';
import 'package:linkifoot/features/user/domain/usecases/user/get_single_user_usecase.dart';

part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());
    try {
      final streamResponse = getSingleUserUseCase.call(uid);
      streamResponse.listen((users) {
        emit(GetSingleUserLoaded(user: users.first));
      });
    } catch (e, stackTrace) {
      AppLogger.logger.e(
        'Error in getSingleUser: $e  $stackTrace',
      );

      emit(GetSingleUserFailure());
    }
  }
}
