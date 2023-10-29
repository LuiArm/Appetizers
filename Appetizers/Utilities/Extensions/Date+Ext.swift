//
//  Date+Ext.swift
//  Appetizers
//
//  Created by luis armendariz on 10/29/23.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
}
