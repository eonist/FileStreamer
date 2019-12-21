@testable import FileStreamer
import XCTest

class FileStreamerTests: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      XCTAssertEqual("Hello, World!", "Hello, World!")
//      guard let fileSize: UInt64 = try? FileStreamReader.fileSize(filePath: fromFilePath) else { Swift.print("err - filesize"); return nil }
//      guard let data: Data = try? FileStreamReader.read(filePath: fromFilePath, startIndex: 0, endIndex: Int(fileSize)) else { Swift.print("unable to read data"); return nil }
//      guard !data.isEmpty else { Swift.print("err, missing file"); return nil }
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
