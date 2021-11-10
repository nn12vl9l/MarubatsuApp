//
//  QuestionViewController.swift
//  MarubatsuApp
//
//  Created by 小倉瑞希 on 2021/11/08.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var marubatsuControl: UISegmentedControl!
    
    var questions:[[String: Any]] = []
        
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if questionField.text! != "" {
            var marubatsuAnswer: Bool = true
            if marubatsuControl.selectedSegmentIndex == 0 {
                marubatsuAnswer = false
            } else {
                marubatsuAnswer = true
            }
            let userDefaults = UserDefaults.standard
            questions = []
            
            if userDefaults.object(forKey: "questions")  != nil {
                questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
            }
            questions.append(
                [
                    "question": questionField.text!,
                    "answer": marubatsuAnswer
                ])
            userDefaults.set(questions, forKey: "questions")
            
            showAlert(message: "問題が保存されました")
            questionField.text = ""
        } else {
            showAlert(message: "問題文を入力してください")
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.removeObject(forKey: "questions")
        userDefaults.set([], forKey: "questions")
        
        showAlert(message: "問題をすべて削除しました。")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                questionField.delegate = self
    }
}

