import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilev2/network/network_models/auth_model/auth_model.dart';
import 'package:mobilev2/network/network_repository/Roles_repository.dart';
import 'package:mobilev2/network/resources/data_state.dart';

part 'roles_event.dart';
part 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  RolesBloc() : super(const RolesInitial()) {
    on<RolesEvent>((event, emit) async {
      if (event is GetRolesEvent) {
        await _getRoles(emit);
      }
    });
  }

  Future<void> _getRoles(Emitter<RolesState> emit) async {
    emit(const LoadingRolesState());

    DataState data = await RolesRepository().getRoles();

    if (data is DataSuccess) {
      List<RolesModel> listRolesModel = data.data;
      emit(SuccessGetRolesState(listRolesModel));
    } else {
      emit(const ErrorGetRolesState());
    }
  }
}
