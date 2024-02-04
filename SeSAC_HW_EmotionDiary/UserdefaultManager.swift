//
//  UserdefaultManager.swift
//  SeSAC_HW_EmotionDiary
//
//  Created by 박지은 on 2/4/24.
//

import Foundation

class UserdefaultManager {
    private init() { }
    static let shared = UserdefaultManager()
    
    let userDefault = UserDefaults.standard
    
    var clickNum: Int {
        get {
            userDefault.integer(forKey: "clickNum")
        }
        set {
            userDefault.set(newValue, forKey: "clickNum")
        }
    }
}

