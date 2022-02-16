class User {
  // variables

  final int id;
  String fullName;
  int age;
  final String role;

  User({
    required this.fullName,
    required this.id,
    required this.role,
    required this.age,
  });

// paramerters or arguments can be passed in 2 ways
//   1. non-named(default) arguments
// 2.named arguments (used with curly brackets)

  // User({required int i, required String f, required String r, required int a}) {
  //   required this.age = a;
  //   required this.fullName = f;
  //   required this.id = i;
  //   required this.role = r;
  // }

  logout(String username) {
    // print("user $username has  logged out");
  }

  void login(String username) {
    print("user $username has  logged in");
  }
}

class AdminUser extends User {
  AdminUser({
    required this.capalilites,
    required int id,
    required String fullName,
    required int age,
  }) : super(role: "Admin", id: id, fullName: fullName, age: age);

  String capalilites;
  delete() {}
  update() {}

  @override
  logout(String username) {
    print("admin is logging out");

    return super.logout(username);
  }
}

class CustomerUser extends User {
  String username;

  CustomerUser(
      {required this.username,
      required int i,
      required String f,
      required int a})
      : super(role: "Customer", id: i, fullName: f, age: a);
  view() {}

  @override
  logout(String username) {
    print("customer is logging out");

    return super.logout(username);
  }
}

void main() {
  var admin = AdminUser(
    capalilites: "can do great work",
    id: 1,
    fullName: "Admin user john",
    age: 10,
  );
  admin.delete();
  // admin.view();

  var customerUser = CustomerUser(
    i: 1,
    f: "Admin user john",
    a: 10,
    username: "customer_username",
  );

  // customerUser.delete();
  customerUser.view();

  admin.logout(admin.fullName);
  customerUser.logout(customerUser.fullName);

  admin.login("username");
  customerUser.login("username");
}

// encapsulation
// polymorphism

// inheritence
// access control
