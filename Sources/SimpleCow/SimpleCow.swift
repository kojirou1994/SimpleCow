@dynamicMemberLookup
public struct SimpleCow<Value: CowValue> {
  @inlinable
  public init(_ storage: Value) {
    self._storage = storage
  }

  @inlinable
  public init<T>(value: T) where Value == AnyCowValue<T> {
    self._storage = .init(value)
  }

  @usableFromInline
  internal var _storage: Value

  @inlinable
  public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Subject {
    get {
      _storage[keyPath: keyPath]
    }
    set {
      if isKnownUniquelyReferenced(&_storage) {
        _storage[keyPath: keyPath] = newValue
      } else {
        _storage = _storage.clone()
        _storage[keyPath: keyPath] = newValue
      }
    }
  }

  @inlinable
  public subscript<Subject>(dynamicMember keyPath: KeyPath<Value, Subject>) -> Subject {
    get {
      _storage[keyPath: keyPath]
    }
  }
}
