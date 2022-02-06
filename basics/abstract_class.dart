abstract class AbstractUser {
  String role;
  AbstractUser({required this.role});
  void login(String username, String password) {
    print(username);
  }
}

class NormalUser extends AbstractUser {
  NormalUser() : super(role: "normal");
  @override
  void login(String username, String password) {
    ////
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    super.login(username, password);
  }
}

class AdminUser extends AbstractUser {
  AdminUser() : super(role: "admin");

  @override
  void login(String username, String password) {}
}

