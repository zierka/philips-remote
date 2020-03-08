import 'dart:convert';

class Volume {
  final bool muted;
  final int current;
  final int min;
  final int max;

  Volume({
    this.muted,
    this.current,
    this.min,
    this.max,
  });

  factory Volume.fromRawJson(String str) => Volume.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        muted: json["muted"],
        current: json["current"],
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "muted": muted,
        "current": current,
        "min": min,
        "max": max,
      };
}