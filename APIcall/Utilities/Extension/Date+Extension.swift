//
//  Date+Extension.swift
//  APIcall
//
//  Created by jay sabeen on 02/01/24.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYrsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
    
}
