//
//  Question.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-11.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import Foundation

class question{
    private var question : String
    private var answer : String
    private var choice1 : String
    private var choice2 : String
    private var choice3 : String
    private var choice4 : String
    
    // intializing the question
    
    init(){
        question = "question is properly processed or not?"
        answer = "No"
        choice1 = "yes"
        choice2 = "no"
        choice3 = "yes"
        choice4 = "no"
    }
    
    init(que: String, ans: String , c1:String , c2:String, c3:String ,c4:String){
        question = que
        answer = ans
        choice1 = c1
        choice2 = c2
        choice3 = c3
        choice4 = c4
        
    }
        // making custom func
    
    func givechoices() -> [String]{
        var temp:[String] = []
        temp.append(choice1)
        temp.append(choice2)
        temp.append(choice3)
        temp.append(choice4)
        
        return temp
        
    }
    
    func checkanswer(input:String) -> Bool{
        if (input == answer){
            return true
        }else{
            return false
        }
        
    }
    
    func giveanswers() -> String{
        return answer
    }
    
    func giveQuestion() -> String{
        return question
    }
}
