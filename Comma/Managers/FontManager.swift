//
//  FontManager.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import Foundation
import UIKit

class FontManager {
    static let shared = FontManager()
    
    private init() {}
    
    func getAppleSDGothicNeoHeavy(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeoH00", size: fontSize)!
    }
    
    func getAppleSDGothicNeoBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)!
    }
    
    func getAppleSDGothicNeoRegular(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)!
    }
    
    func getAppleSDGothicNeoLight(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Light", size: fontSize)!
    }
    
    func getAppleSDGothicNeoMedium(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: fontSize)!
    }
    
    func getAppleSDGothicNeoExtraBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeoEB00", size: fontSize)!
    }
    
    func getAppleSDGothicNeoSemiBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: fontSize)!
    }
    
    func getHarmonyMedium(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HARMONY", size: fontSize)!
    }
}
