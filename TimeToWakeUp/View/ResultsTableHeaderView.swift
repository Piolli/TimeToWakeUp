//
//  ResultsTableHeaderView.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 01/10/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class ResultsTableHeaderView: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .headline), size: 20)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        return label
    }()
    
    override func layoutSubviews() {
        backgroundColor = .white
    }

}
