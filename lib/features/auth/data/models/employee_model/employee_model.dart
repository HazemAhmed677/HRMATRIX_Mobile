import 'package:hive/hive.dart';

import 'department_model.dart';
import 'over_time_request.dart';
import 'salary_details.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  String? password;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  dynamic secondaryPhoneNumber;
  @HiveField(5)
  String? birthDate;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  String? shift;
  @HiveField(8)
  String? maritalStatus;
  @HiveField(9)
  String? nationality;
  @HiveField(10)
  String? nationalId;
  @HiveField(11)
  String? citizen;
  @HiveField(12)
  String? religion;
  @HiveField(13)
  String? dateOfJoining;
  @HiveField(14)
  String? endOfProbation;
  @HiveField(15)
  String? role;
  @HiveField(16)
  dynamic bankAccountNumber;
  @HiveField(17)
  String? bankAccountStatus;
  @HiveField(18)
  String? jobType;
  @HiveField(19)
  String? jobTitle;
  @HiveField(20)
  String? baseSalary;
  @HiveField(21)
  String? housingAllowance;
  @HiveField(22)
  String? transportationAllowance;
  @HiveField(23)
  String? otherAllowance;
  @HiveField(24)
  String? gosi;
  @HiveField(25)
  String? salaryOnGosi;
  @HiveField(26)
  int? hourlyRate;

  int? attendedDays;
  int? absentDays;
  int? absentHours;
  int? missedHours;
  int? vacationDays;
  int? sickDays;
  int? timeOff;
  dynamic workingHours;
  int? workedHours;
  int? idealScore;
  int? actualScore;
  String? performanceScore;
  dynamic evaluationHistory;
  @HiveField(27)
  int? departmentId;
  int? companyId;
  dynamic updatedBy;
  @HiveField(28)
  String? address;
  @HiveField(29)
  dynamic avatar;
  @HiveField(30)
  String? branch;
  String? createdAt;
  String? updatedAt;
  @HiveField(31)
  DepartmentModel? department;
  dynamic updater;
  List<dynamic>? vacations;
  List<dynamic>? familyInfo;
  String? modifiedRole;
  List<dynamic>? employeeProjectsHistory;
  List<dynamic>? employeeMainProjects;
  @HiveField(32)
  dynamic directManager;
  List<dynamic>? timeOffRequests;
  List<OverTimeRequest>? overTimeRequests;
  List<dynamic>? airTicketAllowances;
  SalaryDetails? salaryDetails;
  String? subRole;

  EmployeeModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.secondaryPhoneNumber,
    this.birthDate,
    this.gender,
    this.shift,
    this.maritalStatus,
    this.nationality,
    this.nationalId,
    this.citizen,
    this.religion,
    this.dateOfJoining,
    this.endOfProbation,
    this.role,
    this.bankAccountNumber,
    this.bankAccountStatus,
    this.jobType,
    this.jobTitle,
    this.baseSalary,
    this.housingAllowance,
    this.transportationAllowance,
    this.otherAllowance,
    this.gosi,
    this.salaryOnGosi,
    this.hourlyRate,
    this.attendedDays,
    this.absentDays,
    this.absentHours,
    this.missedHours,
    this.vacationDays,
    this.sickDays,
    this.timeOff,
    this.workingHours,
    this.workedHours,
    this.idealScore,
    this.actualScore,
    this.performanceScore,
    this.evaluationHistory,
    this.departmentId,
    this.companyId,
    this.updatedBy,
    this.address,
    this.avatar,
    this.branch,
    this.createdAt,
    this.updatedAt,
    this.department,
    this.updater,
    this.vacations,
    this.familyInfo,
    this.modifiedRole,
    this.employeeProjectsHistory,
    this.employeeMainProjects,
    this.directManager,
    this.timeOffRequests,
    this.overTimeRequests,
    this.airTicketAllowances,
    this.salaryDetails,
    this.subRole,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    secondaryPhoneNumber: json['secondaryPhoneNumber'] as dynamic,
    birthDate: json['birthDate'] as String?,
    gender: json['gender'] as String?,
    shift: json['shift'] as String?,
    maritalStatus: json['maritalStatus'] as String?,
    nationality: json['nationality'] as String?,
    nationalId: json['nationalId'] as String?,
    citizen: json['citizen'] as String?,
    religion: json['religion'] as String?,
    dateOfJoining: json['dateOfJoining'] as String?,
    endOfProbation: json['endOfProbation'] as String?,
    role: json['role'] as String?,
    bankAccountNumber: json['bankAccountNumber'] as dynamic,
    bankAccountStatus: json['bankAccountStatus'] as String?,
    jobType: json['jobType'] as String?,
    jobTitle: json['jobTitle'] as String?,
    baseSalary: json['baseSalary'] as String?,
    housingAllowance: json['housingAllowance'] as String?,
    transportationAllowance: json['transportationAllowance'] as String?,
    otherAllowance: json['otherAllowance'] as String?,
    gosi: json['GOSI'] as String?,
    salaryOnGosi: json['salaryOnGOSI'] as String?,
    hourlyRate: json['hourlyRate'] as int?,
    attendedDays: json['attendedDays'] as int?,
    absentDays: json['absentDays'] as int?,
    absentHours: json['absentHours'] as int?,
    missedHours: json['missedHours'] as int?,
    vacationDays: json['vacationDays'] as int?,
    sickDays: json['sickDays'] as int?,
    timeOff: json['timeOff'] as int?,
    workingHours: json['workingHours'] as dynamic,
    workedHours: json['workedHours'] as int?,
    idealScore: json['idealScore'] as int?,
    actualScore: json['actualScore'] as int?,
    performanceScore: json['performanceScore'] as String?,
    evaluationHistory: json['evaluation_history'] as dynamic,
    departmentId: json['departmentId'] as int?,
    companyId: json['companyId'] as int?,
    updatedBy: json['updatedBy'] as dynamic,
    address: json['address'] as String?,
    avatar: json['avatar'] as dynamic,
    branch: json['branch'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    department:
        json['department'] == null
            ? null
            : DepartmentModel.fromJson(
              json['department'] as Map<String, dynamic>,
            ),
    updater: json['updater'] as dynamic,
    vacations: json['vacations'] as List<dynamic>?,
    familyInfo: json['familyInfo'] as List<dynamic>?,
    modifiedRole: json['modifiedRole'] as String?,
    employeeProjectsHistory: json['employeeProjectsHistory'] as List<dynamic>?,
    employeeMainProjects: json['employeeMainProjects'] as List<dynamic>?,
    directManager: json['directManager'] as dynamic,
    timeOffRequests: json['timeOffRequests'] as List<dynamic>?,
    overTimeRequests:
        (json['overTimeRequests'] as List<dynamic>?)
            ?.map((e) => OverTimeRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
    airTicketAllowances: json['airTicketAllowances'] as List<dynamic>?,
    salaryDetails:
        json['salaryDetails'] == null
            ? null
            : SalaryDetails.fromJson(
              json['salaryDetails'] as Map<String, dynamic>,
            ),

    subRole: json['subRole'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'secondaryPhoneNumber': secondaryPhoneNumber,
    'birthDate': birthDate,
    'gender': gender,
    'shift': shift,
    'maritalStatus': maritalStatus,
    'nationality': nationality,
    'nationalId': nationalId,
    'citizen': citizen,
    'religion': religion,
    'dateOfJoining': dateOfJoining,
    'endOfProbation': endOfProbation,
    'role': role,
    'bankAccountNumber': bankAccountNumber,
    'bankAccountStatus': bankAccountStatus,
    'jobType': jobType,
    'jobTitle': jobTitle,
    'baseSalary': baseSalary,
    'housingAllowance': housingAllowance,
    'transportationAllowance': transportationAllowance,
    'otherAllowance': otherAllowance,
    'GOSI': gosi,
    'salaryOnGOSI': salaryOnGosi,
    'hourlyRate': hourlyRate,
    'attendedDays': attendedDays,
    'absentDays': absentDays,
    'absentHours': absentHours,
    'missedHours': missedHours,
    'vacationDays': vacationDays,
    'sickDays': sickDays,
    'timeOff': timeOff,
    'workingHours': workingHours,
    'workedHours': workedHours,
    'idealScore': idealScore,
    'actualScore': actualScore,
    'performanceScore': performanceScore,
    'evaluation_history': evaluationHistory,
    'departmentId': departmentId,
    'companyId': companyId,
    'updatedBy': updatedBy,
    'address': address,
    'avatar': avatar,
    'branch': branch,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'department': department?.toJson(),
    'updater': updater,
    'vacations': vacations,
    'familyInfo': familyInfo,
    'modifiedRole': modifiedRole,
    'employeeProjectsHistory': employeeProjectsHistory,
    'employeeMainProjects': employeeMainProjects,
    'directManager': directManager,
    'timeOffRequests': timeOffRequests,
    'overTimeRequests': overTimeRequests?.map((e) => e.toJson()).toList(),
    'airTicketAllowances': airTicketAllowances,
    'salaryDetails': salaryDetails?.toJson(),
    'subRole': subRole,
  };
}
