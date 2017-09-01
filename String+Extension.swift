//
//  String+Extension.swift
//
//  Created by Kusuma Seta on 8/22/17.
//  Copyright © 2017 All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let phoneFormat = "^[0-9]{9,15}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneFormat)
        return phonePredicate.evaluate(with: self)
    }

    var isValidPassword: Bool {
        do {
            let pattern: String = "^(?=.*\\d)(?=.*[a-zA-Z]).{8,}$"
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }    
}
