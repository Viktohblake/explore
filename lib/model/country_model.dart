import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final String flag;
  final String coatOfArms;
  final String population;
  final String region;
  final String capital;
  final String motto;
  final String language;
  final String ethicGroup;
  final String religion;
  final String government;
  final String independence;
  final String area;
  final String currency;
  final String gdp;
  final String timeZone;
  final String dateFormat;
  final String diallingCode;
  final String drivingSide;

  CountryModel(
      {required this.flag,
        required this.coatOfArms,
        required this.population,
      required this.region,
      required this.capital,
      required this.motto,
      required this.language,
      required this.ethicGroup,
      required this.religion,
      required this.government,
      required this.independence,
      required this.area,
      required this.currency,
      required this.gdp,
      required this.timeZone,
      required this.dateFormat,
      required this.diallingCode,
      required this.drivingSide});

  List<Object> get props => [
    flag,
    coatOfArms,
    population,
    religion,
    capital,
    motto,
    language,
    ethicGroup,
    religion,
    government,
    independence,
    area,
    currency,
    gdp,
    timeZone,
    dateFormat,
    diallingCode,
    drivingSide
  ];

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      flag: json['flags']['png'],
        coatOfArms: json['coatOfArms']['png'],
        population: json['population'],
        region: json['region'],
        capital: json['capital'],
        motto: json['null'],
        language: json['languages'],
        ethicGroup: json['null'],
        religion: json['null'],
        government: json['null'],
        independence: json['independent'],
        area: json['area'],
        currency: json['currencies'],
        gdp: json['null'],
        timeZone: json['timezones'],
        dateFormat: json['null'],
        diallingCode: json['idd']['root'],
        drivingSide: json['car']['side']);
  }

}
