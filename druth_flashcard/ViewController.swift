//
//  ViewController.swift
//  druth_flashcard
//
//  Created by STUDENT-SP22 on 3/29/22.
//

import UIKit

//Global Variable for cards
var questions: [String] = []
var answers: [String] = []
var cardIndex = 0

class ViewController: UIViewController {

    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var ALabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardIndex = -1
    }

    @IBAction func GoToSecondView(_ sender: Any) {
        performSegue(withIdentifier: "GoInputView", sender: nil)
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func NextQuestion(_ sender: Any) {
        //1 - check if there is a card
        if questions.count == 0 {
            displayAlert(msgTitle: "No Card", msgContent: "")
            return
        }
        cardIndex += 1
        if cardIndex == questions.count {
            cardIndex = 0
        }
        
        QLabel.text = questions[cardIndex]
        ALabel.text = "???"
    }
    //Delete Current Card from the Stack
    @IBAction func TrashButton(_ sender: Any) {
        if questions.count == 0
        {
            displayAlert(msgTitle: "No Card to Delete!", msgContent: "")
            QLabel.text = "No more cards"
            ALabel.text = "Click the pluse to add a new card"
            return
        }
        
        questions.remove(at: cardIndex)
        answers.remove(at: cardIndex)
        
        displayAlert(msgTitle: "Card Deleted!", msgContent: "")
            
        if questions.count == 0 {
            QLabel.text = "No more cards"
            ALabel.text = "Click the pluse to add a new card"
            return
        }
        
        if cardIndex == questions.count {
            cardIndex = 0
        }
        
        QLabel.text = questions[cardIndex]
        ALabel.text = "???"
        
        
    }
    
    @IBAction func AnswerButton(_ sender: Any) {
        if questions.count == 0
        {
            displayAlert(msgTitle: "No Card!", msgContent: "")
            return
        }
        ALabel.text = answers[cardIndex]
    }
    
}

