//
//  TimeCalculatorViewModel.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 27/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

protocol TimeCalculatorViewModel {
    
    var calculateDescription: String { get }
    
    var sourceTimeForCalculate: Date { get }
    
    var results: Observable<[CalculatedTimeViewModel]?> { get set }
    
    func calculateWith(time: Date)
    
    func calculate()
    
}
