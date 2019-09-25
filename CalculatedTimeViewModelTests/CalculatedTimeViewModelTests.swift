//
//  CalculatedTimeViewModelTests.swift
//  CalculatedTimeViewModelTests
//
//  Created by Alexandr on 10/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import XCTest

@testable import TimeToWakeUp

class CalculatedTimeViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 20, minute: 0),
            wakeUpDate: createDateFrom(day: 2, hour: 6, minute: 40)), expectedTime: createDateFrom(day: 1, hour: 10, minute: 40)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 23, minute: 0),
            wakeUpDate: createDateFrom(day: 2, hour: 8, minute: 0)), expectedTime: createDateFrom(day: 1, hour: 9, minute: 0)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 22, minute: 30),
            wakeUpDate: createDateFrom(day: 2, hour: 7, minute: 30)), expectedTime: createDateFrom(day: 1, hour: 9, minute: 0)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 23, minute: 20),
            wakeUpDate: createDateFrom(day: 2, hour: 8, minute: 30)), expectedTime: createDateFrom(day: 1, hour: 9, minute: 10)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 20, minute: 5),
            wakeUpDate: createDateFrom(day: 2, hour: 6, minute: 45)), expectedTime: createDateFrom(day: 1, hour: 10, minute: 40)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 23, minute: 55),
            wakeUpDate: createDateFrom(day: 2, hour: 6, minute: 30)), expectedTime: createDateFrom(day: 1, hour: 6, minute: 35)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 10, minute: 0),
            wakeUpDate: createDateFrom(day: 2, hour: 14, minute: 0)), expectedTime: createDateFrom(day: 1, hour: 4, minute: 0)
        )
        
        compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel(
            wentToSleepDate: createDateFrom(day: 1, hour: 23, minute: 59),
            wakeUpDate: createDateFrom(day: 2, hour: 8, minute: 59)), expectedTime: createDateFrom(day: 2, hour: 9, minute: 0)
        )
    }
    
    func compareViewModelCalculatesFullSleepTimeWith(viewModel: CalculatedWakeUpTimeViewModel, expectedTime: Date) {
        XCTAssertEqual(viewModel.fullSleepTime.format(), expectedTime.format())
    }
    
    func createDateWithHourAndMinute(_ hour: Int, _ minute: Int) -> Date {
        let components = Calendar.current.dateComponents([.year, .day, .month], from: Date())
        
        return createDateFrom(year: components.year!, month: components.month!, day: components.day!, hour: hour, minute: minute)
    }
    
    func createDateFrom(year: Int = 2019, month: Int = 8, day: Int, hour: Int, minute: Int) -> Date {
        let dateComponents = DateComponents.init(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
        
        let date = Calendar.current.date(from: dateComponents)!
        
        return date
    }
    
}
