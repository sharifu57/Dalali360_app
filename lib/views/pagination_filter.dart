class PaginationFilter {
  late int page;
  late int limit;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginationFilter &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  String toString() => 'PaginationFilter(page: $page, limit: $limit)';
  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}
