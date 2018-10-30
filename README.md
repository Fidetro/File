# FileManager extension

look like this:
```swift
try! File.createFile(appendingPaths: [.documentDirectory,"first","second"], filename: "test.txt", content: nil)
        try! File.removeItem(atPaths: [.documentDirectory,"first"])
```
