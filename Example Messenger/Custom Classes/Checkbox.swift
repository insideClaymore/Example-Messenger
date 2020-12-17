//
//  Checkbox.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit
import AudioToolbox

class Checkbox: UIButton {
    
    var onOff: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTarget(self, action: #selector(toggleOnOff), for: .touchUpInside)
    }
    
    @objc
    func toggleOnOff(button: UIButton) {
        onOff.toggle()
        if onOff {
            button.setImage(Images.checkboxOn, for: .normal)
        } else {
            button.setImage(Images.checkboxOff, for: .normal)
        }
        button.increaseAnimation {}
        AudioServicesPlaySystemSound(Constants.vibrationClickSoundId)
    }
}
