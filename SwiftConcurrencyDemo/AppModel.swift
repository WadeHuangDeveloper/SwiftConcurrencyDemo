//
//  AppModel.swift
//  SwiftConcurrencyDemo
//
//  Created by Huei-Der Huang on 2025/3/20.
//

import Foundation

struct AppModel {
    static let BundleID: String = {
        if let bundleID = Bundle.main.bundleIdentifier {
            return bundleID
        } else {
            return ""
        }
    }()
}
