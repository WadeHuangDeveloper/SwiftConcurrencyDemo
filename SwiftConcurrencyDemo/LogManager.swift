//
//  Log.swift
//  SwiftConcurrencyDemo
//
//  Created by Huei-Der Huang on 2025/3/20.
//

import Foundation

class LogManager {
    static func log(message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let timestamp = dateFormatter.string(from: .now)
        print("\(timestamp) \(message)")
    }
}
