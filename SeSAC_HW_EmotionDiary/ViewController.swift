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
        let tagNum = sender.tag // 이게 공통적으로 들어가있는 곳이 많은데 밖으로 뺄 수가 있나?
        emotionButton[tagNum].setImage(UIImage(named: "slime\(tagNum+1)"), for: .normal)
        emotionLabel[tagNum].text = "\(emotionList[tagNum]) \(UserDefaults.standard.integer(forKey: "\(tagNum)"))"
    }
    
    // 숫자가 변화하면 레이아웃이 왔다갔다해 확인해 지은!
    @IBAction func buttonClicked(_ sender: UIButton, index: Int) {
        // 여길 뭔가 깔끔하게 쓸 수 있을 것 같은데,,
        let tagNum = sender.tag
        let count = UserDefaults.standard.integer(forKey: "\(tagNum)")
        let countUp = count + 1
        UserDefaults.standard.set(countUp, forKey: "\(tagNum)")
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
