//
//  File.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum NumberUtils {

    public static func calculatePercentage(
        value: Double,
        total: Double,
        decimalPlaces: Int = 1
    ) -> String {
        guard total != 0 else { return "0%" }
        let percentage = (value / total) * 100
        return String(format: "%.\(decimalPlaces)f%%", percentage)
    }

    public static func clamp<T: Comparable>(
        _ value: T,
        min minValue: T,
        max maxValue: T
    ) -> T {
        max(minValue, min(maxValue, value))
    }

    public static func formatLargeNumber(_ value: Int) -> String {
        switch value {
        case 0..<1_000:
            return "\(value)"
        case 1_000..<1_000_000:
            return String(format: "%.1fK", Double(value) / 1_000)
        default:
            return String(format: "%.1fM", Double(value) / 1_000_000)
        }
    }
}
