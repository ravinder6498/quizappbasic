//
//  QuizViewController.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-11.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import UIKit

class quizcell: UITableViewCell {
    
    
    @IBOutlet weak var answerlabel: UILabel!
    
}

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizModule: quiz!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizAnswerlist.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        answercheck = quizAnswerlist[indexPath.row ]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! quizcell
        
        cell.answerlabel.text = quizAnswerlist[indexPath.row ]
        return cell
    }
    
    var answercheck = "nothing"
    var quizAnswerlist = ["answer 1","answer 2","answer 3", "answer 4"]

    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var questioncountlabel: UILabel!
    
    @IBAction func actionSubmit(_ sender: Any) {
        chooseanswer()
    }
    @IBOutlet weak var quiztable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiztable.delegate = self
        quiztable.dataSource = self
      

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        quizModule!.reset()
              setup(check: true)
    }
    
    func setup(check: Bool){
        if (check) {
            setCount()
            setchoices()
            setQuestion()
            quiztable.reloadData()
            
        }else{
            performSegue(withIdentifier: "QuizToEnd", sender: nil )
        }
        
        
    }
    
    func setCount(){
        var temp = ""
        temp.append(String(quizModule.giveCurrentQuestionValue()))
        temp.append("/")
        temp.append(String(quizModule.giveTotalQuestionCount()))
        
        questioncountlabel.text = temp
    }
    
    func setQuestion(){
        questionlabel.text = quizModule.givecurrentquestion().giveQuestion()
    }
    
    func setchoices(){
        quizAnswerlist = quizModule.givecurrentquestion().givechoices()
        answercheck = quizAnswerlist[0]
    }
    
    func chooseanswer(){
        quizModule.inputanswer(input: quizModule.givecurrentquestion().checkanswer(input: answercheck ))
        setup(check: quizModule.movetonextQuestion() )
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if(segue.identifier == "QuizToEnd"){
                      var seg = segue.destination as! EndViewController
                  seg.quizModule = self.quizModule
                  
              }
        
    }
    

}
