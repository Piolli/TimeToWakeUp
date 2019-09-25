//
//  CalculatedTimeViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 10/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

class CalculatedWakeUpTimeViewModel {
    
    private(set) var fullSleepTime: Date!
    
    init(wentToSleepDate: Date, wakeUpDate: Date) {
        self.fullSleepTime = calculateDiffBetweenDates(start: wentToSleepDate, end: wakeUpDate)
    }
    
    private func calculateDiffBetweenDates(start: Date, end: Date) -> Date {
        let startCmps = Calendar.current.dateComponents([.hour, .minute], from: start)
        
        var diffDate = end
        diffDate = Calendar.current.date(byAdding: .hour, value: -startCmps.hour!, to: diffDate)!
        diffDate = Calendar.current.date(byAdding: .minute, value: -startCmps.minute!, to: diffDate)!
        
        return diffDate
    }
    
}
