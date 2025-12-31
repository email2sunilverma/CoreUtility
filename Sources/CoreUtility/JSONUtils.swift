//
//  JSONUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum JSONUtils {

    public static func toJSONString(_ dict: [String: Any]) -> String? {
        guard JSONSerialization.isValidJSONObject(dict),
              let data = try? JSONSerialization.data(withJSONObject: dict) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    public static func toDictionary(_ jsonString: String) -> [String: Any]? {
        guard let data = jsonString.data(using: .utf8),
              let obj = try? JSONSerialization.jsonObject(with: data),
              let dict = obj as? [String: Any] else {
            return nil
        }
        return dict
    }
}
