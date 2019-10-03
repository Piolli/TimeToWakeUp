//
//  IKnowWhenGoToSleepViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 27/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

class IKnowWhenGoToSleepViewModel : TimeCalculatorViewModel {
    
    var results: Observable<[CalculatedTimeViewModel]?> = Observable(value: nil)
    var goToSleepAt: Date
    
    var sourceTimeForCalculate: Date {
        return goToSleepAt
    }
    
    var calculateDescription: String {
        return "The best times for wake up"
    }
    
    init(goToSleepAt: Date) {
        self.goToSleepAt = goToSleepAt;
    }
    
    func calculateWith(time: Date) {
        self.goToSleepAt = time
        calculate()
    }
    
    func calculate() {
        let resultTimes = SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: goToSleepAt)
        
        let viewModels = resultTimes.map { (calculatedWakeUpTime) -> CalculatedTimeViewModel in
            return CalculatedTimeViewModel(goToSleepAt: goToSleepAt, calculatedTime: calculatedWakeUpTime)
        }
        
        results.value = viewModels
    }
    
}
