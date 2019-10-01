//
//  ViewController.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTimeResultsViewController()
    }
    
    fileprivate func configureTimeResultsViewController() {
        let vc = CalculatedTimeResultsViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.viewModel = IKnowWhenGoToSleepViewModel(goToSleepAt: Date())
        addChild(vc)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.addSubview(vc.view)
        
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            vc.view.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            vc.view.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        vc.didMove(toParent: self)
    }
    
    
}
