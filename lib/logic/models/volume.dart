import 'dart:convert';

class Volume {
  bool muted;
  int current;
  final int min;
  final int max;

  Volume({
    required this.muted,
    required this.current,
    required this.min,
    required this.max,
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

  @override
  String toString() {
    return 'Volume(muted: $muted, current: $current, min: $min, max: $max)';
  }
}
