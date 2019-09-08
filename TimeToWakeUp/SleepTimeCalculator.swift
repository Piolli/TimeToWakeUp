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
    
    func getTimeWhenGoToSleepForWillWakeUp(at wakeUpTime: Date) -> [Date] {
        var resultTimesForWentToSleep = Array(repeating: wakeUpTime, count: 4)
        
        resultTimesForWentToSleep[0] = resultTimesForWentToSleep[0].plus(minute: -270)
        
        for i in 1..<resultTimesForWentToSleep.count {
            resultTimesForWentToSleep[i] = resultTimesForWentToSleep[i-1].plus(minute: -90)
        }
        
        return resultTimesForWentToSleep
    }
    
    func getTimesWhenToWakeUpIfWentToSleep(at wentToSleepTime: Date) -> [Date] {
        var resultTimesForWakeUp = Array(repeating: wentToSleepTime, count: 4)
        
        resultTimesForWakeUp[0] = resultTimesForWakeUp[0].plus(minute: 105)
        
        for i in 1..<resultTimesForWakeUp.count {
            resultTimesForWakeUp[i] = resultTimesForWakeUp[i-1].plus(minute: 90)
        }
        
        return resultTimesForWakeUp
    }
    
}
