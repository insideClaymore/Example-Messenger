//
//  UITextField + Extension.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

extension UITextField {
    
    //MARK: Color change
    func setupBorder() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
    }
    
    func indicateError() {
        layer.borderColor = Colors.cancelledState.cgColor
        backgroundColor = Colors.cancelledStatePale
        attributedPlaceholder = NSAttributedString(string: placeholder!,
                                                   attributes: [NSAttributedString.Key.foregroundColor: Colors.errorTextInTextField])
    }
    
    func changePlaceholderColor(color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder!,
                                                   attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func reset() {
        if backgroundColor == Colors.cancelledStatePale {
            text = ""
        }
        
        layer.borderColor = UIColor.clear.cgColor
        backgroundColor = UIColor.clear
        attributedPlaceholder = NSAttributedString(string: placeholder!,
                                                   attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholder])
        textColor = .black
    }
}
