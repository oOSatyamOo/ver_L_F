class TripDetailModel{
  final String destination;
  final String tripName;
  final String travelCategory;
  final String costCenter;
  final String employeeName;
  final String employeeEmail;
  final String mobileNumber;
  final String tripPeriod;
  final String tripType;
  final String project;
  final String traveller;
  final String status;
  final String projectExpenses;
  final String travelCost;


  TripDetailModel({
    required this.destination,
    required  this.tripName,
    required  this.travelCategory,
    required  this.costCenter,
    required  this.employeeName,
    required  this.employeeEmail,
    required  this.mobileNumber,
    required  this.tripPeriod,
    required  this.tripType,
    required  this.project,
    required  this.traveller,
    required  this.status,
    required  this.projectExpenses,
    required  this.travelCost,
  });

  factory TripDetailModel.fromJson(Map<String, dynamic> json) => TripDetailModel(
    destination: json["destination"]??'',
    tripName: json["tripName"]??'',
    // data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    travelCategory: json["travelCategory"]??'',
    costCenter: json["costCenter"]??'',
    employeeName: json["employeeName"]??'',
    employeeEmail: json["employeeEmail"]??'',
    mobileNumber: json["mobileNumber"]??'',
    tripPeriod: json["tripPeriod"]??'',
    tripType: json["tripType"]??'',
    project: json["project"]??'',
    traveller: json["traveller"]??'',
    status: json["status"]??'',
    projectExpenses: json["projectExpenses"]??'',
    travelCost: json["travelCost"]??'',
  );
}