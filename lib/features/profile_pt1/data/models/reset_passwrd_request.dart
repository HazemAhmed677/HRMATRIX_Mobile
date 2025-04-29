class ResetPasswrdRequestModel {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ResetPasswrdRequestModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'oldPassword': oldPassword,
    'newPassword': newPassword,
    'passwordConfirmation': confirmPassword,
  };
}
