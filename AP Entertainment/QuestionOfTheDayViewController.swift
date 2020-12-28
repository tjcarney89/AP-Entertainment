//
//  QuestionOfTheDayViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/28/20.
//

import UIKit

class QuestionOfTheDayViewController: UIViewController {
    @IBOutlet weak var questionTextBox: UITextView!
    @IBOutlet weak var answerButton: UIButton!
    
    var question = "How many states are in the United States?"
    var answer = "50"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTextBox.text = question
        self.answerButton.layer.cornerRadius = 15
        self.answerButton.layer.borderWidth = 2
        self.answerButton.layer.borderColor = UIColor(named: "AP Entertainment Red")?.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.answerButton.setTitle("View Answer", for: .normal)
        self.answerButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
        self.answerButton.backgroundColor = UIColor.clear
        self.answerButton.setTitleColor(.black, for: .normal)
        self.answerButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
    }
    

    @IBAction func answerButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 2.0) {
            self.answerButton.setTitle(self.answer, for: .normal)
            self.answerButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
            self.answerButton.backgroundColor = UIColor(named: "AP Entertainment Red")
            self.answerButton.setTitleColor(.white, for: .normal)
            self.answerButton.setImage(nil, for: .normal)
            

        }

    }
    

}
