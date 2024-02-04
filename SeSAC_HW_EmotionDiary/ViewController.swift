//
//  ViewController.swift
//  SeSAC_HW_EmotionDiary
//
//  Created by 박지은 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navigationBar: UINavigationItem!
    @IBOutlet var emotionButton: [UIButton]!
    @IBOutlet var emotionLabel: [UILabel]!
    @IBOutlet var resetButton: UIButton!
    
//    let array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    var array = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    var emotionList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitle()
        
        for index in 0...emotionList.count-1 {
            setButton(emotionButton[index])
        }
        
        resetButton(resetButton)
    }
    
    func navigationTitle() {
        navigationBar.title = "감정 다이어리"
        navigationBar.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationBar.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func leftBarButtonClicked() {
        
    }
    
    func setButton(_ sender: UIButton) {
        let tagNum = sender.tag
        emotionButton[tagNum].setImage(UIImage(named: "slime\(tagNum+1)"), for: .normal)
        
        // 🚨🚨🚨🚨🚨원래 나의 목적🚨🚨🚨🚨🚨
        // UserDefaultManager를 이용해서 저장한 값을 세팅하려고 했는데
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
        
        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
//        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(array[tagNum])"))"


        
        // 1. array[tagNum] -> array[0], array[1], ... array[8]
        // 다 0이 나와서 0ㅇ으로 세팅되겠지

    }
    
    @IBAction func buttonClicked(_ sender: UIButton, index: Int) {
        let tagNum = sender.tag
        print(tagNum)
//        let count = UserDefaults.standard.integer(forKey: "\(tagNum)")
//        let countUp = count + 1
//        UserDefaults.standard.set(countUp, forKey: "\(tagNum)")
//        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
        
        // 3. count의 숫자는 array[tagNum] 에 있는 숫자로 만들거야
        let count = UserDefaults.standard.integer(forKey: "\(tagNum)")
//        let count = UserDefaults.standard.array(forKey: array)
//        let count = UserDefaults.standard.object(forKey: array )
        // 2. 클릭되서 +1이 되게 만들거야
        let countUp = count + 1
        // 4. 그럼 이 countUp된 숫자가 다시 array[tagNum]에 저장되어야겠지?
        UserDefaults.standard.set(countUp, forKey: "\(tagNum)")
        print(array[tagNum])
        // 5. 그럼 이 저장된 숫자를 보여줄거야
        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"

        
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        
        for index in 0...8 {
            let tagNum = emotionButton[index].tag
            UserDefaults.standard.removeObject(forKey: "\(tagNum)")
            emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
        }
    }
    
    func resetButton(_ sender: UIButton) {
        sender.setTitle("0부터 사랑하세요!", for: .normal)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .red
    }
}
