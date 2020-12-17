//
//  PasswordTextField.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit
import AudioToolbox

class PasswordTextField: UITextField {
    
    var rightButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 15)
        rightButton.setImage(Images.closeEye , for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        rightViewMode = .always
        rightView = rightButton
        isSecureTextEntry = true
    }
    
    @objc
    func toggleShowHide(button: UIButton) {
        isSecureTextEntry.toggle()
        
        if isSecureTextEntry {
            rightButton.setImage(Images.closeEye , for: .normal)
        } else {
            rightButton.setImage(Images.openEye , for: .normal)
        }
        button.increaseAnimation {}
        AudioServicesPlaySystemSound(Constants.vibrationClickSoundId)
    }
}

