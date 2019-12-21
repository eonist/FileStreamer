import Foundation
/**
 * Helper methods
 */
extension FileStreamReader {
   /**
    * Returns filesize for a filePath
    * ## Examples:
    * let fileSize = FileStreamReader.fileSize(filePath: filePath)
    * - Note: same as doing `data.count`
    * - Fixme: ⚠️️ Use Result type
    */
   public static func fileSize(filePath: String) throws -> UInt64 {
      let fileUrl = URL(fileURLWithPath: filePath)
      let attributes = try FileManager.default.attributesOfItem(atPath: (fileUrl.path))
      return attributes[FileAttributeKey.size] as? UInt64 ?? (attributes as NSDictionary).fileSize()
   }
}
