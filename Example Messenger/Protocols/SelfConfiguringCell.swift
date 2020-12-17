//
//  SelfConfiguringCell.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
