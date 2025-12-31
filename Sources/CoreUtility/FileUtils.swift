//
//  FileUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum FileUtils {

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
}
