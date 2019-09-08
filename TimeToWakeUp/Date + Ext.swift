//
//  Date + Ext.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 06/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

extension Date {
    
    func plus(minute: Int) -> Date {
        let newDate = Calendar.current.date(byAdding: .minute, value: minute, to: self)!
        return newDate
    }
    
}
