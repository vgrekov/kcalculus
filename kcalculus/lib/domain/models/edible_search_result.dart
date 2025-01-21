enum EdibleSearchResultType {
  food,
  dish,
}

class EdibleSearchResult {
  final String id;
  final String name;
  final String description;
  final EdibleSearchResultType type;
  final DateTime? lastEatenAt;

  const EdibleSearchResult({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.lastEatenAt,
  });
}
