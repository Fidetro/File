//
//  File.swift
//  File
//
//  Created by Fidetro on 2018/10/30.
//  Copyright © 2018 karim. All rights reserved.
//

import Foundation

fileprivate func debugPrintLog<T>(_ message: T,
                                  file: String = #file,
                                  method: String = #function,
                                  line: Int = #line)
{
    assert({ print("\(file)[\(line)], \(method): \(message)"); return true }())
}


fileprivate func debugCode(_ body: () -> Void) {
    assert({ body(); return true }())
}

public protocol StringPath {}
extension String:StringPath {
    
    public static let applicationDirectory = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true)[0]
    
    public static let demoApplicationDirectory = NSSearchPathForDirectoriesInDomains(.demoApplicationDirectory, .userDomainMask, true)[0]
    
    public static let developerApplicationDirectory = NSSearchPathForDirectoriesInDomains(.developerApplicationDirectory, .userDomainMask, true)[0]
    
    public static let adminApplicationDirectory = NSSearchPathForDirectoriesInDomains(.adminApplicationDirectory, .userDomainMask, true)[0]
    
    public static let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    
    public static let developerDirectory = NSSearchPathForDirectoriesInDomains(.developerDirectory, .userDomainMask, true)[0]
    
    public static let userDirectory = NSSearchPathForDirectoriesInDomains(.userDirectory, .userDomainMask, true)[0]
    
    public static let documentationDirectory = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true)[0]
    
    public static let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    public static let coreServiceDirectory = NSSearchPathForDirectoriesInDomains(.coreServiceDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let autosavedInformationDirectory = NSSearchPathForDirectoriesInDomains(.autosavedInformationDirectory, .userDomainMask, true)[0]
    
    public static let desktopDirectory = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
    
    public static let cachesDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    
    public static let applicationSupportDirectory = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    
    @available(iOS 2.0, *)
    public static let downloadsDirectory = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let inputMethodsDirectory = NSSearchPathForDirectoriesInDomains(.inputMethodsDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let moviesDirectory = NSSearchPathForDirectoriesInDomains(.moviesDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let musicDirectory = NSSearchPathForDirectoriesInDomains(.musicDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let picturesDirectory = NSSearchPathForDirectoriesInDomains(.picturesDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let printerDescriptionDirectory = NSSearchPathForDirectoriesInDomains(.printerDescriptionDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let sharedPublicDirectory = NSSearchPathForDirectoriesInDomains(.sharedPublicDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let preferencePanesDirectory = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true)[0]
    
    @available(iOS 4.0, *)
    public static let itemReplacementDirectory = NSSearchPathForDirectoriesInDomains(.itemReplacementDirectory, .userDomainMask, true)[0]
    
    public static let allApplicationsDirectory = NSSearchPathForDirectoriesInDomains(.allApplicationsDirectory, .userDomainMask, true)[0]
    
    public static let allLibrariesDirectory = NSSearchPathForDirectoriesInDomains(.allLibrariesDirectory, .userDomainMask, true)[0]
    
    @available(iOS 11.0, *)
    public static let trashDirectory = NSSearchPathForDirectoriesInDomains(.trashDirectory, .userDomainMask, true)[0]
}

public struct File {
    private static let fileManager = FileManager()
    
    public static func createDirectory(appendingPaths: [String], attributes attr: [FileAttributeKey : Any]? = nil) throws {
        let path = mapToPath(appendingPaths)
        debugPrintLog(path)
        let url = URL(fileURLWithPath: path)
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: attr)
    }
    
    private static func createFile(appendingPath: String, filename: String, content:Data?, attributes attr: [FileAttributeKey : Any]? = nil) {
        let path = appendingPath+"/"+filename
        debugPrintLog(path)
        fileManager.createFile(atPath: path, contents: content, attributes: attr)
    }
    
    public static func createFile(appendingPaths: [String], filename: String, content:Data?, attributes attr: [FileAttributeKey : Any]? = nil) throws {
        try createDirectory(appendingPaths: appendingPaths, attributes: attr)
        createFile(appendingPath: mapToPath(appendingPaths), filename: filename, content: content, attributes:attr)
    }
    
    private static func moveItem(atPath srcPath: String, toPath dstPath: String) throws {
        try fileManager.moveItem(atPath: srcPath, toPath: dstPath)
    }
    
    public static func moveItem(atPaths srcPaths: [String], toPaths dstPaths: [String]) throws {
        try moveItem(atPath: mapToPath(srcPaths), toPath: mapToPath(dstPaths))
    }
    
    private static func removeItem(atPath path: String) throws {
        try fileManager.removeItem(atPath: path)
    }
    
    public static func removeItem(atPaths paths: [String]) throws {
        try removeItem(atPath: mapToPath(paths))
    }
    
    private static func copyItem(atPath srcPath: String, toPath dstPath: String) throws {
        try fileManager.copyItem(atPath: srcPath, toPath: dstPath)
    }
    
    public static func copyItem(atPaths srcPaths: [String], toPaths dstPaths: [String]) throws {
        try copyItem(atPath: mapToPath(srcPaths), toPath: mapToPath(dstPaths))
    }
    
    private static func fileExists(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool {
        return fileManager.fileExists(atPath: path, isDirectory: isDirectory)
    }
    
    public static func fileExists(atPaths paths: [String], isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool {
        return fileExists(atPath: mapToPath(paths), isDirectory: isDirectory)
    }
    
    public static func contentsOfDirectory(atPath paths: [String]) throws -> [String] {
        return try fileManager.contentsOfDirectory(atPath: mapToPath(paths))
    }
    
    public static func subpaths(atPath paths: [String]) -> [String]? {
        return fileManager.subpaths(atPath: mapToPath(paths))
    }
    
    private static func mapToPath(_ paths:[String]) -> String {
        var path = ""
        for appendingPath in paths {
            path = path + appendingPath + "/"
        }
        path.removeLast()
        debugPrintLog(path)
        return path
    }
}
