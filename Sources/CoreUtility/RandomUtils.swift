//
//  RandomUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum RandomUtils {

    public static func generateCode(length: Int = 8) -> String {
        let chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
        return String((0..<length).compactMap { _ in chars.randomElement() })
    }

    public static func randomInt(min: Int, max: Int) -> Int {
        Int.random(in: min...max)
    }

    public static func uuid() -> String {
        UUID().uuidString
    }
}
