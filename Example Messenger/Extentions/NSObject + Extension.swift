//
//  NSObject + Extension.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import Foundation

protocol Reusable {
    
    static var reuseIdentifire: String { get }
}

extension NSObject: Reusable {
    static var reuseIdentifire: String {
        return "\(self)"
    }
}
