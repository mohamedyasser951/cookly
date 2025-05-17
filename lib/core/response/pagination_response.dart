class PaginatedResponse {
  final int total;
  final int skip;
  final int limit;

  PaginatedResponse({
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedResponse(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
