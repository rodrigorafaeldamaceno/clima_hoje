import 'package:climahoje/models/clima_cidade/data.dart';

class ClimaCidade {
  int id;
  String name;
  String state;
  String country;
  String meteogram;
  List<Data> data;

  ClimaCidade(
      {this.id,
      this.name,
      this.state,
      this.country,
      this.meteogram,
      this.data});

  ClimaCidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    country = json['country'];
    meteogram = json['meteogram'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state'] = this.state;
    data['country'] = this.country;
    data['meteogram'] = this.meteogram;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
