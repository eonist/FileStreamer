import Foundation
/**
 * Reads data from a file (Continiously)
 */
public class FSReader {
   /**
    * Reads data from filepath
    * ## Examples:
    * let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
    * let data: Data = FileStreamReader.read(filePath: filePath, startIndex: 50, endIndex: 100)
    * Swift.print("\(String(data: data, encoding: .utf8))") // blalbslalballabalbla...
    */
   public static func read(url: URL, startIndex: UInt64, endIndex: UInt64) throws -> Data {
      do {
         let file: FileHandle = try .init(forReadingFrom: url)
         file.seek(toFileOffset: startIndex)
         let length: Int = .init(endIndex - startIndex)
         let databuffer = file.readData(ofLength: length)
         file.closeFile()
         return databuffer
      }
      catch { throw ReaderError.initError(error: error, forPath: url.path) }
   }
}
/**
 * Helper
 */
extension FSReader {
   /**
    * Support for filePath
    */
   public static func read(filePath: String, startIndex: UInt64, endIndex: UInt64) throws -> Data {
      let url: URL = .init(fileURLWithPath: filePath)
      return try read(url: url, startIndex: startIndex, endIndex: endIndex)
   }
   /**
    * Read string
    */
   static func read(filePath: String, start: UInt64, end: UInt64) throws -> String {
      let data: Data = try read(filePath: filePath, startIndex: start, endIndex: end)
      guard let string = String(data: data, encoding: .utf8) else { throw ReaderError.unableToGetStringFromData(dataLength: data.count) }
      return string
   }
   /**
    * Returns filesize for a filePath
    * ## Examples:
    * let fileSize = FileStreamReader.fileSize(filePath: filePath)
    * - Note: same as doing `data.count`
    */
   public static func fileSize(filePath: String) throws -> UInt64 {
      let fileUrl = URL(fileURLWithPath: filePath)
      let attributes: [FileAttributeKey: Any] = try FileManager.default.attributesOfItem(atPath: (fileUrl.path))
      return attributes[FileAttributeKey.size] as? UInt64 ?? (attributes as NSDictionary).fileSize()
   }
}
/**
 * Error
 */
extension FSReader {
   enum ReaderError: Error {
      case initError(error: Error, forPath: String)
      case unableToGetStringFromData(dataLength: Int)
   }
}
