//
//  Date+Extension.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 4/1/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

extension NSDate {
    
    func timeIntervalInMinutesSinceDate(toDate:NSDate) -> Int {
        
        let calendar = NSCalendar.currentCalendar()
        let datecomponenets = calendar.components(NSCalendarUnit.Minute, fromDate: self, toDate: toDate, options: [])
        let minutes = datecomponenets.minute
        return minutes
    }
    
}