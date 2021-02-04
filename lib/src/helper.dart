class EnumValues<T> {
  final Map<String, T> map;

  const EnumValues(this.map);

  Map<T, String> get reverse {
    return map.map((k, v) => MapEntry(v, k));
  }
}
