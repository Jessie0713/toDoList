//
//  Log.swift
//  toDoList
//
//  Created by 許湘潔 on 2022/10/25.
//

import Foundation
import os.log

class L {
    static func d(_ items: Any..., file: String = #file, function: String = #function,
                  line: Int = #line, tag: String = "Jessie") {
        
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "Asia/Taipei")
        dateFormatter.locale = Locale(identifier: "ja_JP")

        let ismain  = (Thread.isMainThread)  ? "主":"副"
        let content = "\(tag) \(dateFormatter.string(from: Date())) \(items) \(fileName):\(line) \(ismain)"
        print(content)

        #endif
    }
}
