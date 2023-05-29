import 'package:flavor/core/repositories/login_repository.dart';
import 'package:flavor/core/services/login_service.dart';

import '../models/user_data.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<bool> login(UserData user) async => _loginRepository.login(user);
}
