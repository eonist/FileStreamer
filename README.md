![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![Github actions badge](https://badgen.net/github/checks/eonist/FileStreamer?icon=github&label=Build%20Status)](https://github.com/eonist/FileStreamer/actions)

# FileStreamer
Continuous writing of data to disk

### Writer example:
```swift
let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
guard let data: Data = ("black dog" as NSString).data(using: String.Encoding.utf8.rawValue) else {Swift.print("unable to create data");return}
FileStreamWriter.write(url: URL(filePath), data: data, index: 0)
```

### Reader example:
```swift
let filePath: String = NSString(string: "~/Desktop/del.txt").expandingTildeInPath
let data: Data = FileStreamReader.read(filePath: filePath, startIndex: 50, endIndex: 100)
Swift.print("\(String(data: data, encoding: .utf8))") // blalbslalballabalbla...
```

### Size example:
```swift
let fileSize = FileStreamReader.fileSize(filePath: filePath)
```
