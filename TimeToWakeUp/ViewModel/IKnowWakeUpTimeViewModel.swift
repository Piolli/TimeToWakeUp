//
//  IKnowWakeUpTimeViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 03/10/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation


class IKnowWakeUpTimeViewModel : TimeCalculatorViewModel {
    
    var results: Observable<[CalculatedTimeViewModel]?> = Observable(value: nil)
    var wakeUpAt: Date
    
    var sourceTimeForCalculate: Date {
        return wakeUpAt
    }
    
    var calculateDescription: String {
        return "The best times for fall asleep"
    }
    
    init(wakeUpAt: Date) {
        self.wakeUpAt = wakeUpAt;
    }
    
    func calculateWith(time: Date) {
        self.wakeUpAt = time
        calculate()
    }
    
    func calculate() {
        let resultTimes = SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: wakeUpAt)
        
        let viewModels = resultTimes
            .reversed()
            .map { (calculatedGoToSleepTime) -> CalculatedTimeViewModel in
            return CalculatedTimeViewModel(wakeUpAt: wakeUpAt, calculatedTime: calculatedGoToSleepTime)
        }
        
        results.value = viewModels
    }
    
}
