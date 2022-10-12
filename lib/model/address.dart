import 'package:json_annotation/json_annotation.dart';
import '../base/base_model.dart';
import 'geo.dart';
part 'address.g.dart';

@JsonSerializable()
class Address extends BaseModel {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
