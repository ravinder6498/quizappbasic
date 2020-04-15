//
//  learnViewController.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-15.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import UIKit

class learncell: UITableViewCell{
    
    @IBOutlet weak var answerlabel: UILabel!
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var questionnumber: UILabel!
}

class learnViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizAnswerlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "learncell") as! learncell
        cell.questionnumber.text = String(questionno)
        cell.questionlabel.text = Questioncheck[indexPath.row]
        
        cell.answerlabel.text = quizAnswerlist[indexPath.row]
        
        return cell
    }
    

     var quizModule: quiz!
    var Questioncheck = ["nothing"]
    var quizAnswerlist = ["answer ","",""]
    var questionno:Int = 1
    
    @IBOutlet weak var answertable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answertable.dataSource = self
        answertable.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            quizModule.reset()
                setup(check: true)
      }
      
    func setup(check: Bool){
          if (check) {
             
            setquestionsanswers()
            answertable.reloadData()
              
          }else{
              performSegue(withIdentifier: "starttolearn", sender: nil )
          }
          
          
      }
    
    func setquestionsanswers(){
        quizAnswerlist = quizModule.givecurrentquestion().giveanswers()
        Questioncheck = quizModule.givecurrentquestion().giveQuestion()
        questionno = quizModule.giveCurrentQuestionValue()
        
    }

  


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "starttolearn"){
                               var seg = segue.destination as! learnViewController
                           seg.quizModule = self.quizModule
                           
                       }

    }


}
