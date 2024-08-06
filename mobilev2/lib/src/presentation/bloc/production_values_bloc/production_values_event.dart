part of 'production_values_bloc.dart';

abstract class ProductionValuesEvent extends Equatable {
  const ProductionValuesEvent();

  @override
  List<Object> get props => [];
}

class InitializeProductionValues extends ProductionValuesEvent {
  const InitializeProductionValues();
}

class GetProductionValuesEvent extends ProductionValuesEvent {
  final String? dateFrom;
  final String? dateTo;
  final int? divisionId;
  const GetProductionValuesEvent(this.dateFrom, this.dateTo, this.divisionId);
}

class CreateProductionValuesEvent extends ProductionValuesEvent {
  final List<Map<String, dynamic>> productionValues;
  const CreateProductionValuesEvent(this.productionValues);
}
