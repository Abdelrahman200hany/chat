import 'package:ff_bloc/ff_bloc.dart';

import 'package:chatapp/cubit/index.dart';

class LoginBloc extends FFBloc<LoginEvent, LoginState> {
  LoginBloc({    
    required this.provider,
    super.initialState = const LoginState(),
  });
  /// Use this for all requests to backend -  you can mock it in tests
  final LoginProvider provider;

  @override
  LoginState onErrorState(Object error) => state.copy(error: error, isLoading: false);

}
