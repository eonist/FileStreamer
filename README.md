![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/50260726-90be-4083-a558-2717c1ecb928)](https://codebeat.co/projects/github-com-eonist-filestreamer-master)
![Tests](https://github.com/eonist/FileStreamer/workflows/Tests/badge.svg)

# FileStreamer
Continuous writing / reading of data to disk

### Installation:
- SPM `"https://github.com/light-stream/FileStreamer.git"` branch: `"master"`

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
