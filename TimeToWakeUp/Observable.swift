//
//  Observable.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 27/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import Foundation

class Observable<T> {
    
    typealias onChangedCallback = ((T) -> Void)
    
    var value: T {
        didSet {
            onChangedValue?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    private var onChangedValue: onChangedCallback?
    
    public func bind(_ callback: @escaping onChangedCallback) {
        self.onChangedValue = callback
    }
    
}
