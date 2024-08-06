part of 'production_values_bloc.dart';

abstract class ProductionValuesState extends Equatable {
  const ProductionValuesState();

  @override
  List<Object> get props => [];
}

class ProductionValuesInitial extends ProductionValuesState {
  const ProductionValuesInitial();
}

class LoadingProductionValuesState extends ProductionValuesState {
  const LoadingProductionValuesState();
}

class SuccessGetProductionValuesState extends ProductionValuesState {
  final List<ProductionValuesModel> listProductionValuesModel;
  const SuccessGetProductionValuesState(this.listProductionValuesModel);
}

class ErrorGetProductionValuesState extends ProductionValuesState {
  const ErrorGetProductionValuesState();
}

class LoadingCreateProductionValuesState extends ProductionValuesState {
  const LoadingCreateProductionValuesState();
}

class SuccessCreateProductionValuesState extends ProductionValuesState {
  const SuccessCreateProductionValuesState();
}

class ErrorCreateProductionValuesState extends ProductionValuesState {
  const ErrorCreateProductionValuesState();
}
