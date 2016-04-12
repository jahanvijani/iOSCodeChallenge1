//
//  Double+Conversion.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 4/1/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

extension Double {
    
    func toCurrencyString(currencyCode:String) -> String {
        
        let currencyFormatter : NSNumberFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.currencyCode = currencyCode
        
        guard let amountString = currencyFormatter.stringFromNumber(self) else {
            assert(false, "no date from string")
            return ""
        }
        return amountString
        
    }
}
