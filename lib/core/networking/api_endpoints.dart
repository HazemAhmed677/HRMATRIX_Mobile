abstract class ApiEndpoints {
  static const login = 'auth/login';
  static const refreshToken = 'auth/refresh-token';
  static const getProfile = 'employees/profile/get-profile';
  static const resetPassword = 'employees/profile/reset-password';
  static const editProfile = 'employees/profile/update-profile';
  static const getMyLoans = 'loans/myLoans';
  static const getMyDocuments = 'employees/documents/MyDocuments';
  static const getMyAssets = 'assets/myAssets';
  static const getMyAirTickets = 'my-air-ticket-allowance-transactions/getAll';
  static const getMyFinancialTransactions =
      'financialTransaction/dashboard/myApprovedFinancialTransactions';
  // time off & vacation (its types) & over time
  static const getMyRequests = 'requests/my-requests/get';
  static const getMyDisciplinaryAtions =
      'disciplinary-actions/my-disciplinary-actions';
  static const getMyContracts = 'contracts/get/myContracts';
  static const postRequest = 'requests';
}
