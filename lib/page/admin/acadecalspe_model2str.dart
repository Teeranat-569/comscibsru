import 'dart:convert';

class AcadeCalspecial {
  String link3;
  AcadeCalspecial({
    required this.link3,
  });

  AcadeCalspecial copyWith({
    String? link3,
  }) {
    return AcadeCalspecial(
      link3: link3 ?? this.link3,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link3': link3,
    };
  }

  factory AcadeCalspecial.fromMap(Map<String, dynamic> map) {
    return AcadeCalspecial(
      link3: map['link3'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AcadeCalspecial.fromJson(String source) =>
      AcadeCalspecial.fromMap(json.decode(source));

  @override
  String toString() => 'AcadeCalspecial(link3: $link3)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcadeCalspecial && other.link3 == link3;
  }

  @override
  int get hashCode => link3.hashCode;
}
