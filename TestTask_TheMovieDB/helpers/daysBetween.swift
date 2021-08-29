//
//  daysBetween.swift
//  daysBetween
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

func daysBetween(startDate: String) -> String {
    if startDate.isEmpty {
        return ""
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yy-MM-dd"
    let date1 = dateFormatter.date(from: startDate)!
    let date2 = Date()
    
    let diffs = Calendar.current.dateComponents([.year, .month, .day], from: date1, to: date2)
    
    if diffs.year ?? 0 > 0 {
        return "\(diffs.year!) years ago"
    } else if diffs.month ?? 0 > 0 {
        return "\(diffs.month!) month ago"
    } else if diffs.day! > 0 {
        return "\(diffs.day ?? 0) days ago"
    } else if diffs.hour ?? 0 > 0 {
        return "\(diffs.hour!) hours ago"
    }
    
    return "\(diffs.second ?? 0) secons ago"
}
