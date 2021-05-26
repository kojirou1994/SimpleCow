import XCTest
@testable import SimpleCow

extension SimpleCow {
  fileprivate var identifier: ObjectIdentifier {
    .init(_storage)
  }
}

final class SimpleCowTests: XCTestCase {

  func testCowInt() {
    let originalValue = 1
    let newValue = 100

    let immut = SimpleCow(value: originalValue)
    var mut = immut
    XCTAssertEqual(immut.identifier, mut.identifier)

    mut.value = newValue
    XCTAssertEqual(immut.value, originalValue)
    XCTAssertEqual(mut.value, newValue)
    XCTAssertNotEqual(immut.identifier, mut.identifier)
  }
  
}
