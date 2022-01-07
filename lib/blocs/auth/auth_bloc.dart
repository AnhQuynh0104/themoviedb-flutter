import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themoviedb_app/blocs/auth/auth_event.dart';
import 'package:themoviedb_app/blocs/auth/auth_state.dart';
import 'package:themoviedb_app/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  AuthRepo authRepo;

  AuthBloc(AuthState initialState, this.authRepo) : super(initialState);


  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    if(event is AppStart){
      yield LoginInitial();
    } else if(event is LoginButtonPressed){
      yield LoginLoading();
      var session = await authRepo.login(event.username, event.password);
      if(session['success'] == true){
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('sessionId', session['session_id']);
        yield LoginSuccess();
      } else {
        yield LoginFailed(message: 'Login error');
      }
    }
  }
}