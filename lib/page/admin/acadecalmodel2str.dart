import 'dart:convert';

class ArcadeModel {
  final String link2;
  ArcadeModel({
    required this.link2,
  });

  ArcadeModel copyWith({
    String? link2,
  }) {
    return ArcadeModel(
      link2: link2 ?? this.link2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link2': link2,
    };
  }

  factory ArcadeModel.fromMap(Map<String, dynamic> map) {
    return ArcadeModel(
      link2: map['link2'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArcadeModel.fromJson(String source) => ArcadeModel.fromMap(json.decode(source));

  @override
  String toString() => 'ArcadeModel(link2: $link2)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ArcadeModel &&
      other.link2 == link2;
  }

  @override
  int get hashCode => link2.hashCode;
}
