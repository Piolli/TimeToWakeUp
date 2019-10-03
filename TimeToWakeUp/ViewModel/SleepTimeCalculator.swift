//
//  WakeUpCalculator.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

class SleepTimeCalculator {
    
    static let shared = SleepTimeCalculator()
    
    private let countOfCalculatedResults = 5
    
    private init() { }
    
    func getTimeWhenGoToSleepForWillWakeUp(at wakeUpTime: Date) -> [Date] {
        return calculateTimePeriods(for: wakeUpTime, countOfPeriods: countOfCalculatedResults, initialAddedValue: -270, furtherAddedValue: -90)
    }
    
    func getTimesWhenToWakeUpIfWentToSleep(at goToSleepTime: Date) -> [Date] {
        return calculateTimePeriods(for: goToSleepTime, countOfPeriods: countOfCalculatedResults, initialAddedValue: 105, furtherAddedValue: 90)
    }
    
    func calculateTimePeriods(for time: Date, countOfPeriods: Int, initialAddedValue: Int, furtherAddedValue: Int) -> [Date] {
        var resultTimes = Array(repeating: time, count: countOfPeriods)
        resultTimes[0] = resultTimes[0].plus(minute: initialAddedValue)
        
        for i in 1..<resultTimes.count {
            resultTimes[i] = resultTimes[i-1].plus(minute: furtherAddedValue)
        }
        
        return resultTimes
    }
    
}
