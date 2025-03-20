//
//  UIButtonTitle.swift
//  SwiftConcurrencyDemo
//
//  Created by Huei-Der Huang on 2025/3/20.
//

import Foundation

struct UIButtonTitle {
    struct GCD {
        static let syncSerial = "GCD Sync&Serial"
        static let asyncSerial = "GCD Async&Serial"
        static let syncConcurrent = "GCD Sync&Concurrent"
        static let asyncConcurrent = "GCD Async&Concurrent"
    }
    struct AsyncAwait {
        static let Serial = "AsyncAwait Serial"
        static let Concurrency = "AsyncAwait Concurrency"
    }
    struct OperationQueue {
        static let syncSerial = "OperationQueue Sync&Serial"
        static let asyncSerial = "OperationQueue Async&Serial"
        static let syncConcurrent = "OperationQueue Sync&Concurrent"
        static let asyncConcurrent = "OperationQueue Async&Concurrent"
    }
}
