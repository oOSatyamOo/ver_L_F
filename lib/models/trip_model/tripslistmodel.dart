import '/models/trip_model/trip_detail_model.dart';

class TripsListModel {
  final String tripsTitle;
  final String startDate;
  final String endDate;
  final TripDetailModel? data;
  TripsListModel({
    required this.tripsTitle,
    required this.startDate,
    required this.endDate,
    required this.data,
  });
  factory TripsListModel.fromJson(Map<String, dynamic> json) => TripsListModel(
        tripsTitle: json["tripsTitle"] ?? '',
        startDate: json["startDate"] ?? '',
        data: json['data']['tripdetail'] == null
            ? null
            : TripDetailModel.fromJson(json['data']['tripdetail']),
// data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        endDate: json["endDate"] ?? '',
      );
}
