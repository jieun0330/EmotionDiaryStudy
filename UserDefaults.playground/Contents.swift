import UIKit

UserDefaults.standard.set("고래밥", forKey: "nickname")
UserDefaults.standard.set("자갈치", forKey: "nickname")
UserDefaults.standard.string(forKey: "nickname")

let nickname = UserDefaults.standard.string(forKey: "nickname")
print(nickname)
// 왜 옵셔널인가?
// string이 아닐수도 있어서?


UserDefaults.standard.set(true, forKey: "premium")
UserDefaults.standard.bool(forKey: "premium")

UserDefaults.standard.set(35, forKey: "age")
UserDefaults.standard.integer(forKey: "age")

let age = UserDefaults.standard.integer(forKey: "age")
print(age)
