import Foundation
/**
 * Writes data to a file (Continiously)
 */
public final class FSWriter {
   /**
    * Reads data from filepath
    * - Important: ⚠️️ This method writes over the data that is already there (It does not insert)
    * - Note: https://stackoverflow.com/questions/37981375/nsfilehandle-updateatpath-how-can-i-update-file-instead-of-overwriting
    * ## Examples:
    * let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
    * guard let data: Data = ("black dog" as NSString).data(using: String.Encoding.utf8.rawValue) else {Swift.print("unable to create data");return}
    * FileStreamWriter.write(url: URL(filePath), data: data, index: 0)
    */
   public static func write(url: URL, data: Data, index: UInt64) throws {
      let fileExists: Bool = FileManager().fileExists(atPath: url.path)
      if fileExists == false {
         do { try data.write(to: url, options: .atomic) } // Make the file, since it didn't exist
         catch { throw WriterError.unableToWrite(error: error, forFilePath: url.path) }
      }
      do {
         let file: FileHandle = try .init(forUpdating: url)
         file.seek(toFileOffset: index)
         file.write(data)
         file.closeFile()
      } catch {
         throw WriterError.unableToInitFileHandleForWrite(error: error, forFilePath: url.path)
      }
   }
   /**
    * Empties a file
    */
   public static func clear(filePath: String) throws {
      let url: URL = .init(fileURLWithPath: filePath)
      do {
         let file: FileHandle = try .init(forUpdating: url)
         file.truncateFile(atOffset: 0)
         file.closeFile()
      } catch {
         throw WriterError.unableToInitFileHandleForClear(error: error, forFilePath: filePath)
      }
   }
}
/**
 * Convenience
 */
extension FSWriter {
   /**
    * Support for filePath
    */
   public static func write(filePath: String, data: Data, index: UInt64) throws {
      let url: URL = .init(fileURLWithPath: filePath)
      try write(url: url, data: data, index: index)
   }
}
/**
 * Error
 */
extension FSWriter {
   enum WriterError: Error {
      case unableToWrite(error: Error, forFilePath: String)
      case unableToInitFileHandleForWrite(error: Error, forFilePath: String)
      case unableToInitFileHandleForClear(error: Error, forFilePath: String)
   }
}
