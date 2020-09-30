public protocol CowValue: AnyObject {
  func clone() -> Self
}

public final class AnyCowValue<T>: CowValue {
  public init(_ value: T) {
    self.value = value
  }

  public func clone() -> AnyCowValue<T> {
    .init(value)
  }
  public var value: T

}
