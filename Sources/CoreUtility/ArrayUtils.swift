//
//  ArrayUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum ArrayUtils {

    public static func chunk<T>(_ array: [T], chunkSize: Int) -> [[T]] {
        guard chunkSize > 0 else { return [array] }
        return stride(from: 0, to: array.count, by: chunkSize).map {
            Array(array[$0..<min($0 + chunkSize, array.count)])
        }
    }

    public static func unique<T: Hashable>(_ array: [T]) -> [T] {
        Array(Set(array))
    }

    public static func flatten<T>(_ array: [[T]]) -> [T] {
        array.flatMap { $0 }
    }

    public static func element<T>(at index: Int, from array: [T]) -> T? {
        guard index >= 0, index < array.count else { return nil }
        return array[index]
    }
}
