import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/network/network_models/production_values_model/production_values_model.dart';
import 'package:mobilev2/network/network_repository/production_values_repository.dart';
import 'package:mobilev2/network/resources/data_state.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';

part 'production_values_event.dart';
part 'production_values_state.dart';

class ProductionValuesBloc
    extends Bloc<ProductionValuesEvent, ProductionValuesState> {
  ProductionValuesBloc() : super(const ProductionValuesInitial()) {
    on<ProductionValuesEvent>((event, emit) async {
      if (event is InitializeProductionValues) {
        emit(const ProductionValuesInitial());
      }

      if (event is GetProductionValuesEvent) {
        await _getProductionValues(
            emit, event.dateFrom, event.dateTo, event.divisionId);
      }

      if (event is CreateProductionValuesEvent) {
        await _createProductionValues(emit, event.productionValues);
      }
    });
  }

  Future<void> _getProductionValues(Emitter<ProductionValuesState> emit,
      String? dateFrom, String? dateTo, int? divisionid) async {
    emit(const LoadingProductionValuesState());

    DataState data = await ProductionValuesRepository().getProductionValues(
        dateFrom: dateFrom, dateTo: dateTo, divisionId: divisionid);

    if (data is DataSuccess) {
      List<ProductionValuesModel> listProductionValuesModel = data.data;
      emit(SuccessGetProductionValuesState(listProductionValuesModel));
    } else {
      emit(const ErrorGetProductionValuesState());
    }
  }

  Future<void> _createProductionValues(Emitter<ProductionValuesState> emit,
      List<Map<String, dynamic>> listProductionValues) async {
    emit(const LoadingProductionValuesState());

    DataState data = await ProductionValuesRepository()
        .createProductionValues(productionValues: listProductionValues);

    if (data is DataSuccess) {
      List<ProductionValuesModel> listProductionValuesModel = data.data;
      CustomSnackbar().showSuccessSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Production Values Successfully uploaded!");
      emit(SuccessGetProductionValuesState(listProductionValuesModel));
    } else {
      CustomSnackbar().showErrorSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Error creating Production Values!");

      emit(const ErrorGetProductionValuesState());
    }
  }
}
