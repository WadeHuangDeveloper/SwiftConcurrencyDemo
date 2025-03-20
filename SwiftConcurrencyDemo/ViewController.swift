//
//  ViewController.swift
//  SwiftConcurrencyDemo
//
//  Created by Huei-Der Huang on 2025/3/20.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewControllerViewModel()
    private var gcdAsyncSerialButton = UIButton()
    private var gcdAsyncConcurrencyButton = UIButton()
    private var operationQueueAsyncSerialButton = UIButton()
    private var operationQueueAsyncConcurrencyButton = UIButton()
    private var asyncAwaitSerialButton = UIButton()
    private var asyncAwaitConcurrencyButton = UIButton()
    private var buttonStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }

    private func initUI() {
        gcdAsyncSerialButton.addTarget(self, action: #selector(onGcdAsyncSerialButtonClick), for: .touchUpInside)
        gcdAsyncSerialButton.setTitle(UIButtonTitle.GCD.asyncSerial, for: .normal)
        gcdAsyncSerialButton.setTitleColor(.white, for: .normal)
        gcdAsyncSerialButton.backgroundColor = .link
        gcdAsyncSerialButton.layer.cornerRadius = 5
        gcdAsyncSerialButton.translatesAutoresizingMaskIntoConstraints = false
        
        gcdAsyncConcurrencyButton.addTarget(self, action: #selector(onGcdAsyncConcurrencyButtonClick), for: .touchUpInside)
        gcdAsyncConcurrencyButton.setTitle(UIButtonTitle.GCD.asyncConcurrent, for: .normal)
        gcdAsyncConcurrencyButton.setTitleColor(.white, for: .normal)
        gcdAsyncConcurrencyButton.backgroundColor = .link
        gcdAsyncConcurrencyButton.layer.cornerRadius = 5
        gcdAsyncConcurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        
        asyncAwaitSerialButton.addTarget(self, action: #selector(onAsyncAwaitSerialButtonClick), for: .touchUpInside)
        asyncAwaitSerialButton.setTitle(UIButtonTitle.AsyncAwait.Serial, for: .normal)
        asyncAwaitSerialButton.setTitleColor(.white, for: .normal)
        asyncAwaitSerialButton.backgroundColor = .link
        asyncAwaitSerialButton.layer.cornerRadius = 5
        asyncAwaitSerialButton.translatesAutoresizingMaskIntoConstraints = false
        
        asyncAwaitConcurrencyButton.addTarget(self, action: #selector(onAsyncAwaitConcurrencyButtonClick), for: .touchUpInside)
        asyncAwaitConcurrencyButton.setTitle(UIButtonTitle.AsyncAwait.Concurrency, for: .normal)
        asyncAwaitConcurrencyButton.setTitleColor(.white, for: .normal)
        asyncAwaitConcurrencyButton.backgroundColor = .link
        asyncAwaitConcurrencyButton.layer.cornerRadius = 5
        asyncAwaitConcurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        
        operationQueueAsyncSerialButton.addTarget(self, action: #selector(onOperationQueueAsyncSerialButtonClick), for: .touchUpInside)
        operationQueueAsyncSerialButton.setTitle(UIButtonTitle.OperationQueue.asyncSerial, for: .normal)
        operationQueueAsyncSerialButton.setTitleColor(.white, for: .normal)
        operationQueueAsyncSerialButton.backgroundColor = .link
        operationQueueAsyncSerialButton.layer.cornerRadius = 5
        operationQueueAsyncSerialButton.translatesAutoresizingMaskIntoConstraints = false
        
        operationQueueAsyncConcurrencyButton.addTarget(self, action: #selector(onOperationQueueAsyncConcurrencyButtonClick), for: .touchUpInside)
        operationQueueAsyncConcurrencyButton.setTitle(UIButtonTitle.OperationQueue.asyncConcurrent, for: .normal)
        operationQueueAsyncConcurrencyButton.setTitleColor(.white, for: .normal)
        operationQueueAsyncConcurrencyButton.backgroundColor = .link
        operationQueueAsyncConcurrencyButton.layer.cornerRadius = 5
        operationQueueAsyncConcurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.addArrangedSubview(gcdAsyncSerialButton)
        buttonStackView.addArrangedSubview(gcdAsyncConcurrencyButton)
        buttonStackView.addArrangedSubview(operationQueueAsyncSerialButton)
        buttonStackView.addArrangedSubview(operationQueueAsyncConcurrencyButton)
        buttonStackView.addArrangedSubview(asyncAwaitSerialButton)
        buttonStackView.addArrangedSubview(asyncAwaitConcurrencyButton)
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 5
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
        ])
    }
    
    @objc private func onGcdAsyncSerialButtonClick() {
        TaskManager.GCDManager.asyncSerial()
    }

    @objc private func onGcdAsyncConcurrencyButtonClick() {
        TaskManager.GCDManager.asyncConcurrent()
    }
    
    @objc private func onOperationQueueAsyncSerialButtonClick() {
        TaskManager.OperationQueueManager.asyncSerial()
    }
    
    @objc private func onOperationQueueAsyncConcurrencyButtonClick() {
        TaskManager.OperationQueueManager.asyncConcurrency()
    }
    
    @objc private func onAsyncAwaitSerialButtonClick() {
        Task {
            await TaskManager.AsyncAwaitManager.serial()
        }
    }
    
    @objc private func onAsyncAwaitConcurrencyButtonClick() {
        Task {
            await TaskManager.AsyncAwaitManager.concurrency()
        }
    }
}


