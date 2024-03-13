//
//  Date+Extensions.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/16/24.
//

import Foundation

extension Date {
    func midnight() -> Date {
        let cal = Calendar(identifier: .gregorian)
        let midnight = cal.startOfDay(for: self)
        let timeOffset = TimeZone.current.secondsFromGMT()
        return midnight.addingTimeInterval(Double(timeOffset))
    }
}
