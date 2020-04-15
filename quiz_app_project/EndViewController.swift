//
//  EndViewController.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-11.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    
    var quizModule: quiz!
    

    @IBOutlet weak var home: UIButton!
    
    @IBOutlet weak var correctlabel: UILabel!
    
    @IBOutlet weak var incorrectlabel: UILabel!
    
    @IBOutlet weak var totallabel: UILabel!
    
   
    @IBAction func homebutton(_ sender: Any) {
        performSegue(withIdentifier: "endtostart", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup() 
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        settotal()
        setcorrect()
        setincorrect()
    }
    
    func setcorrect(){
        correctlabel.text = String(quizModule.givecorrectcount())
    }
    
    func setincorrect(){
        incorrectlabel.text =  String(quizModule.giveincorrectquestioncount())
    }
    
    func settotal(){
        totallabel.text = String(quizModule.giveTotalQuestionCount() )
    }
 

}
