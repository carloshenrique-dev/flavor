import '../models/user_data.dart';

abstract interface class LoginRepository {
  Future<bool> login(UserData user);
}
