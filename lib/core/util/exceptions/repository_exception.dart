class RepositoryException implements Exception {
  RepositoryException({required this.message});

  final String message;

  @override
  String toString() {
    return '$RepositoryException: $message';
  }
}
