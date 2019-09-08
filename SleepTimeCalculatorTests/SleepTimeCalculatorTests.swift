//
//  SleepTimeCalculatorTests.swift
//  SleepTimeCalculatorTests
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import XCTest
@testable import TimeToWakeUp

class SleepTimeCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTime() {
        let dateComponents = DateComponents.init(hour: 8, minute: 0)
        let wakeAtThisDate = Calendar.current.date(from: dateComponents)!
        print("--------------------------")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM MMM dd,yyyy"
        print(dateFormatter.string(from: wakeAtThisDate))
        
//        dump(wakeAtThisDate)
//        dump(wakeAtThisDate.addingTimeInterval(-60 * 60))
        print("--------------------------")
    }

    func testCalculateTimesForWakeUpAt() {
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: createDateFrom(year: 2019, month: 8, day: 6, hour: 8, minute: 0)),
            withExpectedResults: [
                createDateFrom(year: 2019, month: 8, day: 5, hour: 23, minute: 0),
                createDateFrom(year: 2019, month: 8, day: 6, hour: 0, minute: 30),
                createDateFrom(year: 2019, month: 8, day: 6, hour: 2, minute: 0),
                createDateFrom(year: 2019, month: 8, day: 6, hour: 3, minute: 30)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: createDateFrom(day: 2, hour: 6, minute: 45)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 21, minute: 45),
                createDateFrom(day: 1, hour: 23, minute: 15),
                createDateFrom(day: 2, hour: 0, minute: 45),
                createDateFrom(day: 2, hour: 2, minute: 15)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: createDateFrom(day: 2, hour: 14, minute: 01)),
            withExpectedResults: [
                createDateFrom(day: 2, hour: 5, minute: 01),
                createDateFrom(day: 2, hour: 6, minute: 31),
                createDateFrom(day: 2, hour: 8, minute: 01),
                createDateFrom(day: 2, hour: 9, minute: 31)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: createDateFrom(day: 2, hour: 23, minute: 59)),
            withExpectedResults: [
                createDateFrom(day: 2, hour: 14, minute: 59),
                createDateFrom(day: 2, hour: 16, minute: 29),
                createDateFrom(day: 2, hour: 17, minute: 59),
                createDateFrom(day: 2, hour: 19, minute: 29)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimeWhenGoToSleepForWillWakeUp(at: createDateFrom(day: 2, hour: 0, minute: 0)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 15, minute: 00),
                createDateFrom(day: 1, hour: 16, minute: 30),
                createDateFrom(day: 1, hour: 18, minute: 00),
                createDateFrom(day: 1, hour: 19, minute: 30)
            ]
        )
    }
    
    func testCalculateTimesForWentToSleepAt() {
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: createDateFrom(day: 1, hour: 20, minute: 0)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 21, minute: 45),
                createDateFrom(day: 1, hour: 23, minute: 15),
                createDateFrom(day: 2, hour: 0, minute: 45),
                createDateFrom(day: 2, hour: 2, minute: 15)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: createDateFrom(day: 1, hour: 9, minute: 36)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 11, minute: 21),
                createDateFrom(day: 1, hour: 12, minute: 51),
                createDateFrom(day: 1, hour: 14, minute: 21),
                createDateFrom(day: 1, hour: 15, minute: 51)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: createDateFrom(day: 1, hour: 21, minute: 59)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 23, minute: 44),
                createDateFrom(day: 2, hour: 1, minute: 14),
                createDateFrom(day: 2, hour: 2, minute: 44),
                createDateFrom(day: 2, hour: 4, minute: 14)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: createDateFrom(day: 1, hour: 0, minute: 0)),
            withExpectedResults: [
                createDateFrom(day: 1, hour: 1, minute: 45),
                createDateFrom(day: 1, hour: 3, minute: 15),
                createDateFrom(day: 1, hour: 4, minute: 45),
                createDateFrom(day: 1, hour: 6, minute: 15)
            ]
        )
        
        compare(
            calculateResults : SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: createDateFrom(day: 1, hour: 23, minute: 59)),
            withExpectedResults: [
                createDateFrom(day: 2, hour: 1, minute: 44),
                createDateFrom(day: 2, hour: 3, minute: 14),
                createDateFrom(day: 2, hour: 4, minute: 44),
                createDateFrom(day: 2, hour: 6, minute: 14)
            ]
        )
    }
    
    func compare(calculateResults: [Date], withExpectedResults expectedResults: [Date]) {
        let resultsSorted1 = calculateResults.sorted(by: >)
        let resultsSorted2 = expectedResults.sorted(by: >)
        printFormattedDateArray(resultsSorted1)
        printFormattedDateArray(resultsSorted2)
        XCTAssertEqual(resultsSorted1, resultsSorted2)
    }
    
    func printFormattedDateArray(_ dates: [Date]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"

        for date in dates {
            print(dateFormatter.string(from: date))
        }
        
        print("-------------------------------")
    }
    
    func createDateFrom(year: Int = 2019, month: Int = 8, day: Int, hour: Int, minute: Int) -> Date {
        let dateComponents = DateComponents.init(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute, second: 0)

        let date = Calendar.current.date(from: dateComponents)!
        
        return date
    }
    
    func createDateWithDefaultComponents(hour: Int, minute: Int) -> Date {
        let components = Calendar.current.dateComponents([.year, .day, .month], from: Date())
        
        return createDateFrom(year: components.year!, month: components.month!, day: components.day!, hour: components.hour!, minute: components.minute!)
    }


}
