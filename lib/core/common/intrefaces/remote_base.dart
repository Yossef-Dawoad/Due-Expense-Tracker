/// Remote data source contract for PocketBase API interactions.
abstract interface class RemoteDataBase<T> {
  /// The PocketBase collection name.
  final String collectionName = '';

  /// Creates a new item on the remote server.
  Future<T> addNewItem(T item);

  /// Retrieves a single item by ID.
  Future<T> getItemById(String id);

  /// Retrieves all items from the remote collection.
  Future<List<T>> getAllItems();

  /// Updates an existing item on the remote server.
  Future<T> updateItem(T item);

  /// Deletes an item from the remote server.
  Future<void> deleteItem(T item);
}
