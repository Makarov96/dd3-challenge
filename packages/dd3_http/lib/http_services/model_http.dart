class Model {
  const Model({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<dynamic> results;

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
      results: List<dynamic>.from(json['results'] as List),
    );
  }

  static Model empty() {
    return const Model(
      offset: 0,
      limit: 0,
      total: 0,
      count: 0,
      results: [],
    );
  }
}
