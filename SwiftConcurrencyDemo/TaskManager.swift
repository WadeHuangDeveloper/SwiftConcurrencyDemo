//
//  TaskManager.swift
//  SwiftConcurrencyDemo
//
//  Created by Huei-Der Huang on 2025/3/20.
//

import Foundation

class TaskManager {
    private static func swim() {
        LogManager.log(message: TaskModel.Swim + TaskStatusModel.Start)
        for i in 1...3 {
            LogManager.log(message: "\(TaskModel.Swim) \(i)")
        }
        LogManager.log(message: TaskModel.Swim + TaskStatusModel.End)
    }
    private static func ride() {
        LogManager.log(message: TaskModel.Ride + TaskStatusModel.Start)
        for i in 1...3 {
            LogManager.log(message: "\(TaskModel.Ride) \(i)")
        }
        LogManager.log(message: TaskModel.Ride + TaskStatusModel.End)
    }
    private static func run() {
        LogManager.log(message: TaskModel.Run + TaskStatusModel.Start)
        for i in 1...3 {
            LogManager.log(message: "\(TaskModel.Run) \(i)")
        }
        LogManager.log(message: TaskModel.Run + TaskStatusModel.End)
    }
    private static func swimAsync() async {
        swim()
    }
    private static func rideAsync() async {
        ride()
    }
    private static func runAsync() async {
        run()
    }
}

extension TaskManager {
    class GCDManager {
        static func asyncSerial() {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            let queue = DispatchQueue(label: AppModel.BundleID)
            queue.async { swim() }
            queue.async { ride() }
            queue.async { run() }
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
        
        static func asyncConcurrent() {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            let queue = DispatchQueue(label: AppModel.BundleID, attributes: .concurrent)
            queue.async { swim() }
            queue.async { ride() }
            queue.async { run() }
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
    }
}

extension TaskManager {
    class OperationQueueManager {
        static func asyncSerial() {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            let queue = OperationQueue()
            queue.maxConcurrentOperationCount = 1
            queue.addOperation { swim() }
            queue.addOperation { ride() }
            queue.addOperation { run() }
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
        
        static func asyncConcurrency() {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            let queue = OperationQueue()
            queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
            queue.addOperation { swim() }
            queue.addOperation { ride() }
            queue.addOperation { run() }
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
    }
}

extension TaskManager {
    class AsyncAwaitManager {
        static func serial() async {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            await swimAsync()
            await rideAsync()
            await runAsync()
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
        
        static func concurrency() async {
            LogManager.log(message: "\(Self.self).\(#function) Start")
            
            async let swim: Void = swimAsync()
            async let ride: Void = rideAsync()
            async let run: Void = runAsync()
            await swim
            await ride
            await run
            
            LogManager.log(message: "\(Self.self).\(#function) End")
        }
    }
}
