// import 'package:hrmatrix/features/login/data/models/employee_model.dart';

// class UserModelHiveServices {
//   static Future<void> saveUserLocally(EmployeeModel user) async {
//     loggerInfo('🟢 Saving user locally: $user');

//     var box = await Hive.openBox<UserModel>(Constants.kUserModelBox);
//     await box.put('user', user);
//   }

//   static Future<UserModel?> getUserLocally() async {
//     loggerInfo('🟢 getting user locally');
//     var box = await Hive.openBox<UserModel>(Constants.kUserModelBox);
//     return box.get('user');
//   }

//   static Future<void> deleteUserLocally() async {
//     var box = await Hive.openBox<UserModel>(Constants.kUserModelBox);
//     await box.delete('user');
//   }

//   static Future<void> updateUserLocally(UserModel updatedUser) async {
//     var box = await Hive.openBox<UserModel>(Constants.kUserModelBox);
//     await box.put('user', updatedUser);
//   }
// }
