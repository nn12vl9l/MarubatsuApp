//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 小倉瑞希 on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
        
    }
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            if yourAnswer == ans {
                //                正解ー>currentquestionNumに+1私して鉄銀問題へ
                currentQuestionNum += 1
                showAlert(message: "正解！")
            } else {
                //                不正解
                showAlert(message: "不正解...")
            }
        } else {
            print("答えが入っていません")
            return
        }
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }
        
        showQuestion()
        
    }
}
