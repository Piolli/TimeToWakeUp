//
//  DateRoundTests.swift
//  CalculatedTimeViewModelTests
//
//  Created by Alexandr on 03/10/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import XCTest

@testable import TimeToWakeUp

class DateRoundTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRoundingDates() {
        
        XCTAssertEqual(createDateWith(8, 45).floor(precisionInMinutes: 5).format(), "08:45")
        XCTAssertEqual(createDateWith(8, 44).floor(precisionInMinutes: 5).format(), "08:40")
        XCTAssertEqual(createDateWith(8, 43).floor(precisionInMinutes: 5).format(), "08:40")
        XCTAssertEqual(createDateWith(8, 41).floor(precisionInMinutes: 5).format(), "08:40")
        XCTAssertEqual(createDateWith(8, 50).floor(precisionInMinutes: 5).format(), "08:50")
        XCTAssertEqual(createDateWith(8, 49).floor(precisionInMinutes: 5).format(), "08:45")
        XCTAssertEqual(createDateWith(8, 48).floor(precisionInMinutes: 5).format(), "08:45")
        XCTAssertEqual(createDateWith(8, 47).floor(precisionInMinutes: 5).format(), "08:45")
        XCTAssertEqual(createDateWith(8, 46).floor(precisionInMinutes: 5).format(), "08:45")
        
    }
    
    func createDateWith(_ hour: Int, _ minute: Int) -> Date {
        let components = Calendar.current.dateComponents([.year, .day, .month], from: Date())
        
        return createDateFrom(year: components.year!, month: components.month!, day: components.day!, hour: hour, minute: minute)
    }
    
    func createDateFrom(year: Int = 2019, month: Int = 8, day: Int, hour: Int, minute: Int) -> Date {
        let dateComponents = DateComponents.init(calendar: Calendar.current, year: year, month: month, day: day, hour: hour, minute: minute, second: 0)
        
        let date = Calendar.current.date(from: dateComponents)!
        
        return date
    }

}
