//
//  ViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 10/3/20.
//

import UIKit
import MessageUI

class SubmitAnswerViewController: UIViewController, MFMessageComposeViewControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var submitAnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.delegate = self
        submitAnswerButton.layer.cornerRadius = 20
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.answerTextField.text = nil
        controller.dismiss(animated: true, completion: nil)
        print("TEXT SENT!")
    }

    @IBAction func submitAnswerButtonTapped(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let answer = answerTextField.text
            let messageController = MFMessageComposeViewController()
            messageController.body = answer
            messageController.recipients = ["6076241656"]
            messageController.messageComposeDelegate = self
            self.present(messageController, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

