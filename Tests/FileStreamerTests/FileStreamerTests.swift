import XCTest
import ResourceHelper
import FileStreamer

class FileStreamerTests: XCTestCase {
   func testExample() {
      XCTAssertTrue(readFile())
   }
}
extension FileStreamerTests {
   /**
    * Test Filesize and
    */
   func readFile() -> Bool {
      let fromFilePath: String = ResourceHelper.projectRootURL(projectRef: #file, fileName: "temp.bundle/demo.mp3").path
      guard let fileSize: UInt64 = try? FSReader.fileSize(filePath: fromFilePath) else { Swift.print("err - filesize"); return false }
      Swift.print("fileSize:  \(fileSize)")
      guard let data: Data = try? FSReader.read(filePath: fromFilePath, startIndex: 0, endIndex: fileSize) else { Swift.print("unable to read data"); return false }
      guard !data.isEmpty else { Swift.print("err, missing file"); return false }
      Swift.print("data.count:  \(data.count)")
      Swift.print("data is readable ✅")
      return true
   }
}
