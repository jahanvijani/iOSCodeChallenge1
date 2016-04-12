//
//  String+Conversion.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 4/1/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

extension String {
    
    func toFormattedDateString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        guard let date = dateFormatter.dateFromString(self) else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "dd/MM/yyyy - h:mm a" //"EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let timeStamp = dateFormatter.stringFromDate(date)
        print(timeStamp)
        return timeStamp
    }
    
    func toCurrency(amount:Int,currencyCode:String) -> String {
        
        let currencyFormatter : NSNumberFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.currencyCode = currencyCode
        
        guard let amountString = currencyFormatter.stringFromNumber(amount) else {
            assert(false, "no date from string")
            return ""
        }
        return amountString

    }
}

