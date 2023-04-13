![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![Tests](https://github.com/light-stream/FileStreamer/workflows/Tests/badge.svg)

# FileStreamer
Continuous writing / reading of data to disk

### Installation:
- SPM `"https://github.com/light-stream/FileStreamer.git"` branch: `"master"`

### Writer example:
```swift
let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
guard let data: Data = ("black dog" as NSString).data(using: String.Encoding.utf8.rawValue) else {Swift.print("unable to create data");return}
FSWriter.write(url: URL(filePath), data: data, index: 0)
```

### Reader example:
```swift
let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
let data: Data = FSReader.read(filePath: filePath, startIndex: 50, endIndex: 100)
Swift.print("\(String(data: data, encoding: .utf8))") // blalbslalballabalbla...
```

### Size example:
```swift
let fileSize = FSReader.fileSize(filePath: filePath)
```
