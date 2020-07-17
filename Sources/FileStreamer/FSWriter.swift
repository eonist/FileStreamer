import Foundation
/**
 * Writes data to a file (Continiously)
 * - Fixme: ⚠️️ Use FileSugar instead of this, move to own repo
 */
public final class FSWriter {
   /**
    * Reads data from filepath
    * - Fixme: ⚠️️ Use Result type, maybe not?
    * - Fixme: ⚠️️ add own ErrorType WriteError: Error etc
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
         catch { throw NSError(domain: ("FileStreamWriter.write() - Error: \(error.localizedDescription) creating \(url.path)"), code: 0) }
      }
      do {
         let file: FileHandle = try .init(forUpdating: url)
         file.seek(toFileOffset: index)
         file.write(data)
         file.closeFile()
      }
      catch { throw NSError(domain: "FileStreamWriter.write() - Error: \(error.localizedDescription) creating \(url.path)", code: 0) }
   }
   /**
    * Empties a file
    * - Fixme: ⚠️️ Use Result type
    */
   public static func clear(filePath: String) throws {
      let url: URL = .init(fileURLWithPath: filePath)
      do {
         let file: FileHandle = try .init(forUpdating: url)
         file.truncateFile(atOffset: 0)
         file.closeFile()
      } catch {
         throw NSError(domain: "Error: \(error) creating \(filePath)", code: 0)
      }
   }
}
/**
 * Convenience
 */
extension FSWriter {
   /**
    * Support for filePath
    * - Fixme: ⚠️️ Use Result type
    */
   public static func write(filePath: String, data: Data, index: UInt64) throws {
      let url: URL = .init(fileURLWithPath: filePath)
      try write(url: url, data: data, index: index)
   }
}
