import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/blocs/auth/auth_event.dart';
import 'package:themoviedb_app/blocs/auth/auth_state.dart';
import 'package:themoviedb_app/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthRepo authRepo;

  AuthBloc(AuthState initialState, this.authRepo) : super(initialState){
    on<AppStart>(
        (event, emit) async {
          emit(LoginInitial());
          // try{
          //   final prefs = await SharedPreferences.getInstance();
          // }
        }
    );
    on<LoginButtonPressed>(
        (event, emit) async {
            emit(
                LoginLoading()
            );
            try{
                var session = await authRepo.login(event.username, event.password);
                if(session['success'] == true){
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('sessionId', session['session_id']);
                  emit(LoginSuccess());
                } else {
                  emit(LoginFailed(message: 'User not found'));
                }
            } catch(e){
              emit(LoginFailed(message: 'Server disconnect'));
            }
        }
    );
  }
}