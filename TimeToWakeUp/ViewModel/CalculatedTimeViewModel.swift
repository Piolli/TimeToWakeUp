//
//  CalculatedTimeViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 27/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

struct CalculatedTimeViewModel : Equatable {
    
    private var startTime: Date
    private var calculatedTime: Date
    private var diffentTime: Date!
    
    var calculatedTimeFormatted: String {
        return calculatedTime.format()
    }
    
    var diffentTimeFormatted: String {
        return "Sleep time: \(diffentTime.format())"
    }
    
    init(startTime: Date, calculatedTime: Date) {
        self.startTime = startTime
        self.calculatedTime = calculatedTime
        self.diffentTime = calculateDiffBetween(firstDate: startTime, and: calculatedTime)
    }
    
    func calculateDiffBetween(firstDate start: Date, and end: Date) -> Date {
        let startCmps = Calendar.current.dateComponents([.hour, .minute], from: start)
        
        var diffDate = end
        diffDate = Calendar.current.date(byAdding: .hour, value: -startCmps.hour!, to: diffDate)!
        diffDate = Calendar.current.date(byAdding: .minute, value: -startCmps.minute!, to: diffDate)!
        
        return diffDate
    }
    
    
    
}
