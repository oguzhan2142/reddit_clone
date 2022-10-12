import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
part 'geo.g.dart';

@JsonSerializable()
class Geo extends BaseModel {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
