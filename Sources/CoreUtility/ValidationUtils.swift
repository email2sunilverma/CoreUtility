//
//  ValidationUtils.swift
//  
//
//  Created by Sunil Verma on 31/12/25.
//

import Foundation
public enum ValidationUtils {

    public static func isValidEmail(_ email: String) -> Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: email)
    }

    public static func isValidPhoneNumber(_ phone: String) -> Bool {
        let regex = #"^\+?[0-9]{7,15}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex)
            .evaluate(with: phone)
    }
}
