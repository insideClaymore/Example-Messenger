//
//  UIFont + Extension.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

extension UIFont {
    
    public enum OpenSansType: String {
        case extraboldItalic = "-ExtraboldItalic"
        case semiboldItalic = "-SemiboldItalic"
        case semibold = "-Semibold"
        case regular = "-Regular"
        case lightItalic = "Light-Italic"
        case light = "-Light"
        case italic = "-Italic"
        case extraBold = "-Extrabold"
        case boldItalic = "-BoldItalic"
        case bold = "-Bold"
    }
    
    public enum HelveticaNeueType: String {
        case condensedBlack = "-CondensedBlack"
        case condensedBold = "-CondensedBold"
        case bold = "-Bold"
        case boldItalic = "-BoldItalic"
        case medium = "-Medium"
        case mediumItalic = "-MediumItalic"
        case regular = ""
        case italic = "-Italic"
        case light = "-Light"
        case lightItalic = "LightItalic"
        case thin = "-Thin"
        case thinItalic = "-ThinItalic"
        case ultraLight = "-UltraLight"
        case ultraLightItalic = "-UltraLightItalic"
    }
    
    static func OpenSans(_ type: OpenSansType, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont.init(name: "OpenSans\(type.rawValue)", size: size)!
    }
    static func HelveticaNeue(_ type: HelveticaNeueType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont.init(name: "HelveticaNeue\(type.rawValue)", size: size)!
    }
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
    
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
    
    static func openSans20() -> UIFont? {
        return UIFont.init(name: "OpenSans-Bold", size: 20)
    }
    
    static func openSansBold(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "OpenSans-Bold", size: size)
    }
}
