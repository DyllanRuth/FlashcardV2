//
//  SecondViewController.swift
//  druth_flashcard
//
//  Created by STUDENT-SP22 on 3/29/22.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate  { //Used to view Errors

    @IBOutlet weak var QuestionInput: UITextField!
    @IBOutlet weak var AnswerInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionInput.delegate = self
        AnswerInput.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func AddCard(_ sender: Any) {
        QuestionInput.resignFirstResponder()
        AnswerInput.resignFirstResponder()
        
        if QuestionInput.text == "" || AnswerInput.text == "" {
            displayAlert(msgTitle: "Invalid card to add", msgContent: "Please complete the input")
            return
        }
        questions.append(QuestionInput.text!)
        answers.append(AnswerInput.text!)
        QuestionInput.text = ""
        AnswerInput.text = ""
        displayAlert(msgTitle: "New Card is Added", msgContent:
        "")
        
    }
    
}
