//
//  UserdefaultManager.swift
//  SeSAC_HW_EmotionDiary
//
//  Created by 박지은 on 2/4/24.
//

import Foundation

class UserdefaultManager {
    private init() { }
    
    // static을 안쓸땐 접근이 불가능한처럼 오류가 떴는데
    // static을 쓰니까 오류가 안난다! 전역 ?
    
    static func getClickNum(_ tag: Int) -> Int {
        return UserDefaults.standard.integer(forKey: "\(tag)")
    }
    
    static func setClickNum(_ newValue: Int, tag: Int) {
        return UserDefaults.standard.set(newValue, forKey: "\(tag)")
    }
    
    /*
     UserDefaultManager 안에서는 get, set 쓰는 코드가 세트인것마냥 생각을 했는데
     메서드로도 만들어보고, 매개변수를 넣어보고, return을 넣어서 값을 반환하고, static을 써서 다른 파일에서 쓸 수 있게끔 만들어보니까
     조금씩 이해가 간다
     */
    
    var clickArr: [Int] {
        get {
            UserDefaults.standard.array(forKey: "ClickArr") as? [Int] ?? []
            
            // 위 코드처럼 쓰는 이유
            /*
             let a = UserDefaults.standard.array(forKey: "ClickArr")
             -> a의 타입을 찍어보면 [Any]가 나온다
             -> 나는 이걸 [Int] 배열로 만들고 싶으니까
             -> 타입캐스팅을 한다
             let b = a as? [Int]
             -> b의 타입을 찍어보면 [Int]? 옵셔널이니까
             -> 옵셔널 바인딩을 해준다
             if let c = b {
             }
             그걸 한줄로 쓰면 위에 처럼 된다!!!!!! 유레카~~~~~ 감사합니다 브랜님
             */
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "ClickArr")
        }
    }
    
    //    static let shared = UserdefaultManager()
    //
    //    let userDefault = UserDefaults.standard
    //
    //    var clickNum: Int {
    //        get {
    //            userDefault.integer(forKey: "clickNum")
    //        }
    //        set {
    //            userDefault.set(newValue, forKey: "clickNum")
    //        }
    //    }
}

// 🚨🚨🚨🚨🚨원래 나의 목적🚨🚨🚨🚨🚨
// UserDefaultManager를 이용해서 저장한 값을 세팅하려고 했는데

// clickNum 자리에 tagNum이 들어와야되는거잖아

// tagNum에 맞게 저장되는 곳이 한곳이 아니라 9곳인거잖아??
// 그럼 recap때처럼 단순히 닉네임 하나를 저장하고 세팅해주는게 아니라

// 버튼마다 저장되는 숫자가 달라야 하는건데
// 그럼 array[tagNum] 하면 되는거같아서 했는데
// key 값은 string이여야 하잖아?
// 그럼 "array[0]" = "0"
// "array[1]" = "0"
// 뭔데
// "0" 이라는 똑같은 공간에 저장되고있는거잖아
// 그럼 배열을 써야 되는건가 해서
// 그래서 배열의 길로 샘
