//
//  StringUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation

public enum StringUtils {

    // MARK: - Masking

    public static func maskSensitiveData(
        _ input: String,
        visibleStart: Int = 4,
        visibleEnd: Int = 4
    ) -> String {
        guard input.count > visibleStart + visibleEnd else { return input }
        let start = input.prefix(visibleStart)
        let end = input.suffix(visibleEnd)
        let maskedLength = input.count - visibleStart - visibleEnd
        let masked = String(repeating: "*", count: maskedLength)
        return "\(start)\(masked)\(end)"
    }

    // MARK: - String Operations

    public static func extractInitials(from name: String, maxLength: Int = 2) -> String {
        let words = name.split(separator: " ")
        let initials = words.compactMap { $0.first?.uppercased() }
        return initials.prefix(maxLength).joined()
    }

    public static func reverse(_ input: String) -> String {
        String(input.reversed())
    }

    public static func truncate(_ input: String, length: Int, suffix: String = "...") -> String {
        guard input.count > length else { return input }
        let index = input.index(input.startIndex, offsetBy: length)
        return "\(input[..<index])\(suffix)"
    }

    public static func removeWhitespaces(_ input: String) -> String {
        input.replacingOccurrences(of: "\\s+", with: "", options: .regularExpression)
    }
}
