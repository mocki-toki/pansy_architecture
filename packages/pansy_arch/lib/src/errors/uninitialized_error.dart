class UninitializedError extends Error {
  @override
  String toString() => 'Invalid usage: object is not initialized';
}
