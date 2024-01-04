//
//  ViewController.swift
//  SeSAC_HW_EmotionDiary
//
//  Created by 박지은 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navigationBar: UINavigationItem!
    // 버튼을 배열로 만들면 안되는건가
    //    @IBOutlet var emotionButton: [UIButton]!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    //    @IBOutlet var emotionLabel: [UILabel]!
    @IBOutlet var oneLabel: UILabel!
    @IBOutlet var twoLabel: UILabel!
    @IBOutlet var threeLabel: UILabel!
    @IBOutlet var fourLabel: UILabel!
    @IBOutlet var fiveLabel: UILabel!
    @IBOutlet var sixLabel: UILabel!
    @IBOutlet var sevenLabel: UILabel!
    @IBOutlet var eightLabel: UILabel!
    @IBOutlet var nineLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    
    var emotionList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    var count = [0,0,0,0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitle()
        
        // 이렇게 다 불러줘야되는건가? 정녕???
        emotionImg(oneButton, label: oneLabel)
        emotionImg(twoButton, label: twoLabel)
        emotionImg(threeButton, label: threeLabel)
        emotionImg(fourButton, label: fourLabel)
        emotionImg(fiveButton, label: fiveLabel)
        emotionImg(sixButton, label: sixLabel)
        emotionImg(sevenButton, label: sevenLabel)
        emotionImg(eightButton, label: eightLabel)
        emotionImg(nineButton, label: nineLabel)
        
        resetButton.setTitle("0부터 사랑하라", for: .normal)
        
    }
    
    func navigationTitle() {
        navigationBar.title = "감정 다이어리"
        navigationBar.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationBar.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func leftBarButtonClicked() {
        
    }
    
    func emotionImg(_ button: UIButton, label: UILabel) {
        
        button.setImage(UIImage(named: "slime\(button.tag+1)"), for: .normal)
        label.text = "\(emotionList[button.tag]) \(count[button.tag])"
    }
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        
        count[sender.tag] += 1
        
        // 아니 왜 저 숫자에 sender.tag 넣으면 되는거 아닌가???? 왜 안되는거같지??? 신발
        // 숫자가 늘어나면 레이아웃이 왔다갔다함 확인해라!
        oneLabel.text = "\(emotionList[0]) \(count[0])"
        twoLabel.text = "\(emotionList[1]) \(count[1])"
        threeLabel.text = "\(emotionList[2]) \(count[2])"
        fourLabel.text = "\(emotionList[3]) \(count[3])"
        fiveLabel.text = "\(emotionList[4]) \(count[4])"
        sixLabel.text = "\(emotionList[5]) \(count[5])"
        sevenLabel.text = "\(emotionList[6]) \(count[6])"
        eightLabel.text = "\(emotionList[7]) \(count[7])"
        nineLabel.text = "\(emotionList[8]) \(count[8])"
    }
}
