//
//  TimeCalculatorViewModelTests.swift
//  CalculatedTimeViewModelTests
//
//  Created by Alexandr on 30/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import XCTest

@testable import TimeToWakeUp

class TimeCalculatorViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testIKnowWhenGoToSleepViewModel() {
//        let goToSleepAt = createDateWithHourAndMinute(10, 0)
//        let viewModel = IKnowWhenGoToSleepViewModel(goToSleepAt: goToSleepAt)
//        
//        let bindCallback = expectation(description: "waiting for calculate times in view model")
//        
//        viewModel.results.bind { (results) in
//            XCTAssertNotNil(results)
//            
//            let expected = [
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(11, 45)),
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(13, 30)),
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(15, 15)),
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(17, 0)),
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(18, 45)),
//                CalculatedTimeViewModel(goToSleepAt: goToSleepAt, wakeUpAt: self.createDateWithHourAndMinute(20, 30))
//            ]
//            
//            for (index, result) in (results!).enumerated() {
//                XCTAssertEqual(result, expected[index])
//            }
//            
//            bindCallback.fulfill()
//        }
//        
//        viewModel.calculate()
//        
//        wait(for: [bindCallback], timeout: 1)
//    }
    


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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
