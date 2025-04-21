import 'package:hive/hive.dart';

part 'salary_details_model.g.dart';

@HiveType(typeId: 2)
class SalaryDetailsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? baseSalary;
  @HiveField(2)
  String? housingAllowance;
  @HiveField(3)
  String? transportationAllowance;
  @HiveField(4)
  String? otherAllowance;
  @HiveField(5)
  String? gosi;
  @HiveField(6)
  String? salaryOnGosi;
  int? commissions;
  int? overTime;
  int? vacationWork;
  @HiveField(7)
  int? financialTransaction;
  int? shortageAmount;
  int? disciplinaryAction;
  int? loan;
  int? massAction;
  int? posKpis;
  int? negKpis;
  int? tax;
  @HiveField(8)
  int? totalSalary;
  @HiveField(9)
  int? netSalary;

  SalaryDetailsModel({
    this.id,
    this.baseSalary,
    this.housingAllowance,
    this.transportationAllowance,
    this.otherAllowance,
    this.gosi,
    this.salaryOnGosi,
    this.commissions,
    this.overTime,
    this.vacationWork,
    this.financialTransaction,
    this.shortageAmount,
    this.disciplinaryAction,
    this.loan,
    this.massAction,
    this.posKpis,
    this.negKpis,
    this.tax,
    this.totalSalary,
    this.netSalary,
  });

  factory SalaryDetailsModel.fromJson(json) => SalaryDetailsModel(
    id: json['id'] as int?,
    baseSalary: json['baseSalary'] as String?,
    housingAllowance: json['housingAllowance'] as String?,
    transportationAllowance: json['transportationAllowance'] as String?,
    otherAllowance: json['otherAllowance'] as String?,
    gosi: json['GOSI'] as String?,
    salaryOnGosi: json['salaryOnGOSI'] as String?,
    commissions: json['commissions'] as int?,
    overTime: json['overTime'] as int?,
    vacationWork: json['vacationWork'] as int?,
    financialTransaction: json['financialTransaction'] as int?,
    shortageAmount: json['shortageAmount'] as int?,
    disciplinaryAction: json['disciplinaryAction'] as int?,
    loan: json['loan'] as int?,
    massAction: json['massAction'] as int?,
    posKpis: json['posKPIS'] as int?,
    negKpis: json['negKPIS'] as int?,
    tax: json['tax'] as int?,
    totalSalary: json['totalSalary'] as int?,
    netSalary: json['netSalary'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'baseSalary': baseSalary,
    'housingAllowance': housingAllowance,
    'transportationAllowance': transportationAllowance,
    'otherAllowance': otherAllowance,
    'GOSI': gosi,
    'salaryOnGOSI': salaryOnGosi,
    'commissions': commissions,
    'overTime': overTime,
    'vacationWork': vacationWork,
    'financialTransaction': financialTransaction,
    'shortageAmount': shortageAmount,
    'disciplinaryAction': disciplinaryAction,
    'loan': loan,
    'massAction': massAction,
    'posKPIS': posKpis,
    'negKPIS': negKpis,
    'tax': tax,
    'totalSalary': totalSalary,
    'netSalary': netSalary,
  };
}
