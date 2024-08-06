import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/network/network_repository/divisions_repository.dart';
import 'package:mobilev2/network/resources/data_state.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';

part 'divisions_event.dart';
part 'divisions_state.dart';

class DivisionsBloc extends Bloc<DivisionsEvent, DivisionsState> {
  DivisionsBloc() : super(const DivisionsInitial()) {
    on<DivisionsEvent>((event, emit) async {
      if (event is GetDivisionsEvent) {
        await _getDivisions(emit);
      }

      if (event is CreateDivisionsEvent) {
        await _createDivision(emit, event.divisionName);
      }
    });
  }

  Future<void> _getDivisions(Emitter<DivisionsState> emit) async {
    emit(const LoadingDivisionsState());

    DataState data = await DivisionsRepository().getDivisions();

    if (data is DataSuccess) {
      List<DivisionsModel> listDivisionsModel = data.data;
      emit(SuccessGetDivisionsState(listDivisionsModel));
    } else {
      emit(const ErrorGetDivisionsState());
    }
  }

  Future<void> _createDivision(
      Emitter<DivisionsState> emit, String divisionName) async {
    emit(const LoadingDivisionsState());

    DataState data =
        await DivisionsRepository().createDivision(divisionName: divisionName);

    if (data is DataSuccess) {
      CustomSnackbar().showSuccessSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Division Created!");

      divisionsBloc.add(const GetDivisionsEvent());

      emit(const SuccessCreateDivisionsState());
    } else {
      CustomSnackbar().showErrorSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Division Creation Failed!");
      emit(const ErrorCreateDivisionsState());
    }
  }
}
