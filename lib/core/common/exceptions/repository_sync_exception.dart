/// Aggregate sync failure raised by offline-first repositories.
class RepositorySyncException implements Exception {
  RepositorySyncException({required this.repository, required this.failures});

  final String repository;
  final List<String> failures;

  @override
  String toString() {
    return 'RepositorySyncException($repository): ${failures.length} failure(s): ${failures.join(' | ')}';
  }
}
