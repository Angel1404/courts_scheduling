import 'dart:convert';

RainModel rainModelFromJson(String str) => RainModel.fromJson(json.decode(str));
List<RainModel> rainModelListFromJson(String str) => (jsonDecode(str) as List<dynamic>).map((e) => RainModel.fromJson(e)).toList();

String rainModelToJson(RainModel data) => json.encode(data.toJson());

class RainModel {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final HourlyUnits hourlyUnits;
  final Hourly hourly;

  RainModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
  });

  RainModel copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    int? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    double? elevation,
    CurrentUnits? currentUnits,
    Current? current,
    HourlyUnits? hourlyUnits,
    Hourly? hourly,
  }) =>
      RainModel(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        generationtimeMs: generationtimeMs ?? this.generationtimeMs,
        utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
        timezone: timezone ?? this.timezone,
        timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
        elevation: elevation ?? this.elevation,
        currentUnits: currentUnits ?? this.currentUnits,
        current: current ?? this.current,
        hourlyUnits: hourlyUnits ?? this.hourlyUnits,
        hourly: hourly ?? this.hourly,
      );

  factory RainModel.fromJson(Map<String, dynamic> json) => RainModel(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnits.fromJson(json["current_units"]),
        current: Current.fromJson(json["current"]),
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
      };
}

class Current {
  final String time;
  final int interval;
  final double rain;

  Current({
    required this.time,
    required this.interval,
    required this.rain,
  });

  Current copyWith({
    String? time,
    int? interval,
    double? rain,
  }) =>
      Current(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        rain: rain ?? this.rain,
      );

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        rain: json["rain"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "rain": rain,
      };
}

class CurrentUnits {
  final String time;
  final String interval;
  final String rain;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.rain,
  });

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? rain,
  }) =>
      CurrentUnits(
        time: time ?? this.time,
        interval: interval ?? this.interval,
        rain: rain ?? this.rain,
      );

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        rain: json["rain"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "rain": rain,
      };
}

class Hourly {
  final List<String> time;
  final List<double> temperature2M;
  final List<int> relativeHumidity2M;
  final List<double> rain;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.rain,
  });

  Hourly copyWith({
    List<String>? time,
    List<double>? temperature2M,
    List<int>? relativeHumidity2M,
    List<double>? rain,
  }) =>
      Hourly(
        time: time ?? this.time,
        temperature2M: temperature2M ?? this.temperature2M,
        relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
        rain: rain ?? this.rain,
      );

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativeHumidity2M: List<int>.from(json["relative_humidity_2m"].map((x) => x)),
        rain: List<double>.from(json["rain"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relative_humidity_2m": List<dynamic>.from(relativeHumidity2M.map((x) => x)),
        "rain": List<dynamic>.from(rain.map((x) => x)),
      };
}

class HourlyUnits {
  final String time;
  final String temperature2M;
  final String relativeHumidity2M;
  final String rain;

  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativeHumidity2M,
    required this.rain,
  });

  HourlyUnits copyWith({
    String? time,
    String? temperature2M,
    String? relativeHumidity2M,
    String? rain,
  }) =>
      HourlyUnits(
        time: time ?? this.time,
        temperature2M: temperature2M ?? this.temperature2M,
        relativeHumidity2M: relativeHumidity2M ?? this.relativeHumidity2M,
        rain: rain ?? this.rain,
      );

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        rain: json["rain"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "rain": rain,
      };
}
