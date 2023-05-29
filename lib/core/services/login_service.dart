import '../models/user_data.dart';

abstract interface class LoginService {
  Future<bool> login(UserData user);
}
