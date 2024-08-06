import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remoteworkermobile/main.dart';
import 'package:remoteworkermobile/network/network_repository/timeinout_repository.dart';
import 'package:remoteworkermobile/network/resources/data_state.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_snackbar.dart';

part 'timeinout_event.dart';
part 'timeinout_state.dart';

class TimeinoutBloc extends Bloc<TimeinoutEvent, TimeinoutState> {
  TimeinoutBloc() : super(const TimeinoutInitial()) {
    on<TimeinoutEvent>((event, emit) async {
      if (event is InitializeTimeinoutEvent) {
        emit(const TimeinoutInitial());
      }

      if (event is ProdTimeinoutEvent) {
        emit(const LoadingTimeinoutState());

        DataState data = await TimeInOutRepository().createTimeInOut(
            userid: 1,
            time: DateTime.now(),
            date: DateTime.now(),
            type: event.type,
            geolocation: event.geolocation,
            image: event.image);

        if (data is DataSuccess) {
          CustomSnackbar().showSuccessSnackbar(
              MainApp.navigatorKey.currentContext!,
              content: "Upload Success!");

          emit(const SuccessTimeinoutState());
        } else {
          emit(const ErrorTimeinoutState());
        }
      }
    });
  }
}
