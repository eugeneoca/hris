import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_preferences.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_prefs_helper.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/network/network_models/auth_model/auth_model.dart';
import 'package:mobilev2/network/network_repository/auth_repository.dart';
import 'package:mobilev2/network/resources/data_state.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetStoredAuthEvent) {
        await _getStoredAuthEvent(emit);
      }

      if (event is LoginEvent) {
        await _login(emit, event.username, event.password);
      }
    });
  }

  Future<void> _getStoredAuthEvent(Emitter<AuthState> emit) async {
    emit(const LoadingAuthState());

    String? token = await SharedPrefsUtil().getString(SharedPrefsHelper.token);

    if (token != null && token.isNotEmpty) {
      emit(const AuthenticatedState());
    } else {
      emit(const UnauthenticatedState());
    }
  }

  Future<void> _login(
      Emitter<AuthState> emit, String username, String password) async {
    emit(const LoadingAuthState());

    DataState data =
        await AuthRepository().login(username: username, password: password);

    if (data is DataSuccess) {
      AuthModel authModel = data.data;
      if (authModel.token != null) {
        CustomSnackbar().showSuccessSnackbar(
            MainApp.navigatorKey.currentContext!,
            content: "Login Success!");
        SharedPrefsUtil()
            .storeString(SharedPrefsHelper.token, authModel.token!);
        emit(const AuthenticatedState());
      } else {
        emit(const UnauthenticatedState());
      }
    } else {
      emit(const UnauthenticatedState());
    }
  }
}
