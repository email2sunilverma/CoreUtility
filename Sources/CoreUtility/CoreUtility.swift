// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct CoreUtility {
    
    public static func greet(name: String) -> String {
          return "Hello, \(name)"
      }
    // MARK: - String Masking
    
    /// Masks sensitive data like credit cards: "1234567890123456" -> "1234****3456"
    public static func maskSensitiveData(_ input: String, visibleStart: Int = 4, visibleEnd: Int = 4) -> String {
        guard input.count > visibleStart + visibleEnd else { return input }
        let start = input.prefix(visibleStart)
        let end = input.suffix(visibleEnd)
        let maskedLength = input.count - visibleStart - visibleEnd
        let masked = String(repeating: "*", count: maskedLength)
        return "\(start)\(masked)\(end)"
    }
    
    // MARK: - Random Generators
    
    /// Generates a random alphanumeric code of specified length
    public static func generateRandomCode(length: Int = 8) -> String {
        let chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
        return String((0..<length).compactMap { _ in chars.randomElement() })
    }
    
    /// Generates random integer in range
    public static func randomInt(min: Int, max: Int) -> Int {
        return Int.random(in: min...max)
    }
    
    /// Generates a new UUID string
    public static func generateUUID() -> String {
        return UUID().uuidString
    }
    
    // MARK: - File Size Formatter
    
    /// Converts bytes to human readable format
    public static func formatFileSize(bytes: Int64) -> String {
        let units = ["B", "KB", "MB", "GB", "TB"]
        var size = Double(bytes)
        var unitIndex = 0
        
        while size >= 1024 && unitIndex < units.count - 1 {
            size /= 1024
            unitIndex += 1
        }
        
        return String(format: "%.1f %@", size, units[unitIndex])
    }
    
    // MARK: - Duration Formatter
    
    /// Converts seconds to readable duration: 3661 -> "1h 1m 1s"
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
    
    // MARK: - Array Utilities
    
    /// Splits array into chunks of specified size
    public static func chunkArray<T>(_ array: [T], chunkSize: Int) -> [[T]] {
        guard chunkSize > 0 else { return [array] }
        return stride(from: 0, to: array.count, by: chunkSize).map {
            Array(array[$0..<min($0 + chunkSize, array.count)])
        }
    }
    
    /// Returns array with unique elements
    public static func uniqueArray<T: Hashable>(_ array: [T]) -> [T] {
        return Array(Set(array))
    }
    
    /// Flattens 2D array into 1D
    public static func flattenArray<T>(_ array: [[T]]) -> [T] {
        return array.flatMap { $0 }
    }
    
    /// Returns element at index or nil
    public static func element<T>(at index: Int, from array: [T]) -> T? {
        guard index >= 0, index < array.count else { return nil }
        return array[index]
    }
    
    // MARK: - String Utilities
    
    /// Extracts initials from name: "John Doe" -> "JD"
    public static func extractInitials(from name: String, maxLength: Int = 2) -> String {
        let words = name.split(separator: " ")
        let initials = words.compactMap { $0.first?.uppercased() }
        return initials.prefix(maxLength).joined()
    }
    
    /// Reverses a string
    public static func reverseString(_ input: String) -> String {
        return String(input.reversed())
    }
    
    /// Truncates string to specified length with optional suffix
    public static func truncate(_ input: String, length: Int, suffix: String = "...") -> String {
        guard input.count > length else { return input }
        let index = input.index(input.startIndex, offsetBy: length)
        return "\(input[..<index])\(suffix)"
    }
    
    /// Removes all whitespaces and newlines
    public static func removeWhitespaces(_ input: String) -> String {
        return input.replacingOccurrences(of: "\\s+", with: "", options: .regularExpression)
    }
    
    // MARK: - Percentage & Number Utilities
    
    /// Calculates percentage with formatted output
    public static func calculatePercentage(value: Double, total: Double, decimalPlaces: Int = 1) -> String {
        guard total != 0 else { return "0%" }
        let percentage = (value / total) * 100
        return String(format: "%.\(decimalPlaces)f%%", percentage)
    }
    
    /// Clamps a value between min and max
    public static func clamp<T: Comparable>(_ value: T, min minValue: T, max maxValue: T) -> T {
        return max(minValue, min(maxValue, value))
    }
    
    /// Converts large numbers to human-readable format: 1000 -> "1K", 1_000_000 -> "1M"
    public static func formatLargeNumber(_ value: Int) -> String {
        switch value {
            case 0..<1_000: return "\(value)"
            case 1_000..<1_000_000: return String(format: "%.1fK", Double(value)/1_000)
            default: return String(format: "%.1fM", Double(value)/1_000_000)
        }
    }
    
    // MARK: - Date & Time Utilities
    
    /// Returns current timestamp in seconds
    public static func currentTimestamp() -> TimeInterval {
        return Date().timeIntervalSince1970
    }
    
    /// Returns number of days between two dates
    public static func daysBetween(_ from: Date, _ to: Date) -> Int {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: from)
        let end = calendar.startOfDay(for: to)
        return calendar.dateComponents([.day], from: start, to: end).day ?? 0
    }
    
    /// Converts date to "time ago" string
    public static func timeAgo(from date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        if interval < 60 { return "\(Int(interval))s ago" }
        if interval < 3600 { return "\(Int(interval/60))m ago" }
        if interval < 86400 { return "\(Int(interval/3600))h ago" }
        return "\(Int(interval/86400))d ago"
    }
    
    
    
    /// Run closure in background thread
    public static func runInBackground(_ block: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async { block() }
    }
}


