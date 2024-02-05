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
        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserdefaultManager.getClickNum(tagNum))"
        
        // 1. array[tagNum] -> array[0], array[1], ... array[8]
        // 다 0이 나와서 0ㅇ으로 세팅되겠지
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton, index: Int) {
        let tagNum = sender.tag
        //        let count = UserDefaults.standard.integer(forKey: "\(tagNum)")
        //        UserDefaults.standard.set(countUp, forKey: "\(tagNum)")
        //        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
        
        // 3. count의 숫자는 array[tagNum] 에 있는 숫자로 만들거야
        //        let count = UserDefaults.standard.integer(forKey: "\(tagNum)")
        let count = UserdefaultManager.getClickNum(tagNum)
        // 2. 클릭되서 +1이 되게 만들거야
        let countUp = count + 1
        // 4. 그럼 이 countUp된 숫자가 다시 array[tagNum]에 저장되어야겠지?
        //        UserDefaults.standard.set(countUp, forKey: "\(tagNum)")
        UserdefaultManager.setClickNum(countUp, tag: tagNum)
        // 5. 그럼 이 저장된 숫자를 보여줄거야
        //        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserdefaultManager.getClickNum(tagNum))"        
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
