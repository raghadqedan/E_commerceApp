class UserModel{
  final String userName;
  final String email;
  final String password;

  UserModel({required this.userName, required this.email, required this.password});

}
UserModel dummyUser=UserModel(email: 'raghad@yahoo.com',userName: 'Raghad',password:'1234');