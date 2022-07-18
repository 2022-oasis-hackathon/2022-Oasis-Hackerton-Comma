//
//  ColorManager.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import Foundation
import UIKit

class ColorManager {
    static let shared = ColorManager()
    
    private init() {}
    
    func getThemeMain() -> UIColor {
        return UIColor(named: "ThemeMainColor")!
    }
}

