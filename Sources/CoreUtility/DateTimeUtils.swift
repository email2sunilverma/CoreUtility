//
//  File.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum DateTimeUtils {

    public static func currentTimestamp() -> TimeInterval {
        Date().timeIntervalSince1970
    }

    public static func daysBetween(_ from: Date, _ to: Date) -> Int {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: from)
        let end = calendar.startOfDay(for: to)
        return calendar.dateComponents([.day], from: start, to: end).day ?? 0
    }

    public static func timeAgo(from date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        if interval < 60 { return "\(Int(interval))s ago" }
        if interval < 3600 { return "\(Int(interval / 60))m ago" }
        if interval < 86400 { return "\(Int(interval / 3600))h ago" }
        return "\(Int(interval / 86400))d ago"
    }

    public static func formatDuration(seconds: Int) -> String {
        let hrs = seconds / 3600
        let mins = (seconds % 3600) / 60
        let secs = seconds % 60

        var result: [String] = []
        if hrs > 0 { result.append("\(hrs)h") }
        if mins > 0 { result.append("\(mins)m") }
        if secs > 0 || result.isEmpty { result.append("\(secs)s") }

        return result.joined(separator: " ")
    }
}
