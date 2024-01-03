//
//  ViewController.swift
//  SeSAC_HW_EmotionDiary
//
//  Created by 박지은 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navigationBar: UINavigationItem!
    // 버튼을 배열로 만들면
    @IBOutlet var emotionButton: [UIButton]!
    @IBOutlet var emotionLabel: [UILabel]!
    
    var emotionList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    var index = [0,0,0,0,0,0,0,0,0]
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitle()
        emotionImg()
        // emotionButton[?] 뭘 넣어야 버튼 모두가 작동되는거지?
//        emotionButtonClicked(emotionButton[0])
//        emotionButtonClick(emotionButton)
    }
        
    func navigationTitle() {
        navigationBar.title = "감정 다이어리"
        navigationBar.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationBar.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func leftBarButtonClicked() {
        
    }
    
    func emotionImg() {
        for item in 0...emotionButton.count - 1 {
            emotionButton[item].setImage(UIImage(named: "slime\(item+1)"), for: .normal)
            emotionLabel[item].text = emotionList[item] + "\(index[item])"
        }
    }
    
    // 코드 작성중
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
//        for item in 0...emotionButton.count - 1 {
//            index[item] += 1
//            emotionLabel[item].text = emotionList[item] +
//            "\(index[item])"
//        }
//        
//        print(index[sender.tag - 1] += 1)
//        var test = index[sender.tag - 1]
//        test += 1
//        
//        index[sender.tag]
//        
//        index[sender.tag - 1] += 1
//        emotionLabel[test].text = emotionList[test]
//        print(index[sender.tag])
        
//        print(index[sender.tag])
//        print("!")
        
        
        
    }
    // sender를 배열로 만들어야되는건가?
//    @IBAction func emotionButtonClick(_ sender: [UIButton]) {
//        print(index[sender[0].tag])
//        
//    }
    
    }
