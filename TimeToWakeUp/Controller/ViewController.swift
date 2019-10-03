//
//  ViewController.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultsViewController: CalculatedTimeResultsViewController!
    var calculateTypesSegmentedControl: UISegmentedControl!
    
    let knowWakeUpTimeViewModel = IKnowWakeUpTimeViewModel(wakeUpAt:
        Date()
            .plus(minute: -60*9)
            .floor(precisionInMinutes: 5)
    )
    
    let knowWhenGoToSleepTimeViewModel = IKnowWhenGoToSleepViewModel(
        goToSleepAt: Date()
        .floor(precisionInMinutes: 5)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModelSwitcher()
        configureTimeResultsViewController()
        
    }
    
    @objc func calculateTypesWasChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            resultsViewController.viewModel = knowWakeUpTimeViewModel
        } else {
            resultsViewController.viewModel = knowWhenGoToSleepTimeViewModel
        }
    }
    
    func configureViewModelSwitcher() {
        calculateTypesSegmentedControl = UISegmentedControl(items: [
            "I want to wake up at",
            "I go to sleep at"
            ])
        calculateTypesSegmentedControl.selectedSegmentIndex = 0
        
        calculateTypesSegmentedControl.addTarget(self, action: #selector(calculateTypesWasChanged(_:)), for: .valueChanged)
        
        calculateTypesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculateTypesSegmentedControl)

        NSLayoutConstraint.activate([
            calculateTypesSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            calculateTypesSegmentedControl.widthAnchor.constraint(equalToConstant: view.bounds.width - 32),
            calculateTypesSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    fileprivate func configureTimeResultsViewController() {
        resultsViewController = CalculatedTimeResultsViewController()
        resultsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(resultsViewController)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.addSubview(resultsViewController.view)
        
        NSLayoutConstraint.activate([
            resultsViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            resultsViewController.view.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            resultsViewController.view.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            resultsViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: calculateTypesSegmentedControl.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        resultsViewController.didMove(toParent: self)
        
        //set default calculate time type
        resultsViewController.viewModel = knowWakeUpTimeViewModel
    }
    
}
