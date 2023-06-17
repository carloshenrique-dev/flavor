import 'package:flavor/core/repositories/login_repository.dart';

import '../../models/user_data.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<bool> login(UserData user) async => _loginRepository.login(user);
}
