//
//  CalculatedTimeViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 10/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

class CalculatedResultsViewModel {
    
    let wantToWakeUpAtTimeIndex = 1
    let wantGoToSleepAtTimeIndex = 0
    
    var goToSleepTime: Date? {
        didSet {
            guard let goToSleepTime = goToSleepTime else {
                print("goToSleepTime is nil")
                return
            }
            
            self.wentToSleepResults = SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: goToSleepTime)
            print("did set \(goToSleepTime.format())")
        }
    }
    
    var wakeUpTime: Date? {
        didSet {
            guard let wakeUpTime = wakeUpTime else {
                print("wakeUpTime is nil")
                return
            }
            
            self.wentToSleepResults = SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: wakeUpTime)
            print("did set \(wakeUpTime.format())")
        }
    }
    
    
    var wentToSleepResults: [Date]!
    
    init(goToSleepTime: Date) {
        self.wentToSleepResults = SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: goToSleepTime)
        self.goToSleepTime = goToSleepTime
    }
    
    init(wakeUpTime: Date) {
        self.wentToSleepResults = SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: wakeUpTime)
        self.wakeUpTime = wakeUpTime
    }
    
    var countOfResults: Int {
        return wentToSleepResults.count
    }
    
    
    func createWakeUpTimeViewModel(at indexPath: IndexPath, switchIndex: Int) -> CalculatedWakeUpTimeViewModel? {
        if switchIndex == wantGoToSleepAtTimeIndex {
            guard let goToSleepTime = goToSleepTime else {
                print("goToSleepTime is nil")
                return nil
            }
            
            return CalculatedWakeUpTimeViewModel(wentToSleepDate: goToSleepTime, wakeUpDate: self.wentToSleepResults[indexPath.row])
        } else {
            guard let wakeUpTime = wakeUpTime else {
                print("wakeUpTime is nil")
                return nil
            }
            
            return CalculatedWakeUpTimeViewModel(wentToSleepDate: self.wentToSleepResults[indexPath.row], wakeUpDate: wakeUpTime)
        }
    }
    
    
}
