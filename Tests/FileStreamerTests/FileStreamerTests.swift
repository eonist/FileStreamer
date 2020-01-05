import XCTest
import ResourceHelper
import FileStreamer

class FileStreamerTests: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      XCTAssertTrue(readFile())
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
extension FileStreamerTests {
   /**
    * Test Filesize and
    */
   func readFile() -> Bool {
      let fromFilePath: String = ResourceHelper.projectRootURL(projectRef: #file, fileName: "temp.bundle/demo.mp3").path
      guard let fileSize: UInt64 = try? FileStreamReader.fileSize(filePath: fromFilePath) else { Swift.print("err - filesize"); return false }
      Swift.print("fileSize:  \(fileSize)")
      guard let data: Data = try? FileStreamReader.read(filePath: fromFilePath, startIndex: 0, endIndex: Int(fileSize)) else { Swift.print("unable to read data"); return false }
      guard !data.isEmpty else { Swift.print("err, missing file"); return false }
      Swift.print("data.count:  \(data.count)")
      Swift.print("data is readable ✅")
      return true
   }
}
