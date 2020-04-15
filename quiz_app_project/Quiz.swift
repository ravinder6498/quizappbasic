//
//  Quiz.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-11.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import Foundation

class quiz{
    private var questionlist: [question]
    private var currentQuestion: Int
    private var correctCount: Int
    private var incorrectcount: Int

    init() {
        currentQuestion = 0
        correctCount = 0
        incorrectcount = 0
        questionlist = [question.init(que: "Which animal can be seen on the Porsche logo?", ans: "Horse", c1: "Cheetah", c2: "Jaguar", c3: "Horse", c4: "Eagle"),question.init(que: "Which country invented tea?", ans: "China", c1: "India", c2: "China", c3: "America", c4: "Dubai"),question.init(que: "Which country is responsible for giving us pizza and pasta?", ans: "Italy", c1: "America", c2: "Germany", c3: "America", c4: "Italy"),question.init(que: "Which company owns Bugatti, Lamborghini. Audi, Porsche and Ducati?", ans: "Volkswagen", c1: "Volkswagen", c2: "Ford Motor Company", c3: "General Motors", c4: "Fiat Chrysler Automobiles"),question.init(que: "Which organ has four chambers?", ans: " Heart", c1: "Liver", c2: " Heart", c3: "Lungs", c4: " Brain"),question.init(que: "What percentage of our bodies is made up of water?", ans: "60-65%", c1: "70-75%", c2: "65-70%", c3: "60-65%", c4: "75-80%"), question.init(que: "Which desert is the largest in the world?", ans: "Sahara Desert", c1: "Great Basin Desert", c2: "Arabian Desert", c3: "Great Victoria Desert ", c4: "Sahara Desert"),question.init(que: "Which continent is the largest?", ans: "Asia", c1: "Europe", c2: "Asia", c3: "North America", c4: "Africa"),question.init(que: "How many hearts does an octopus have?", ans: "Three", c1: "Three", c2: "Two", c3: "One", c4: "Four"),question.init(que: "Which boxer was known as “The Greatest” and “The People’s Champion”?", ans: "Muhammad Ali", c1: "Mike Tyson", c2: "Muhammad Ali", c3: "Floyd Mayweather", c4: "Conor McGregor")]
        
    }
    
    func givecurrentquestion() -> question{
        return questionlist[currentQuestion ]
    }
    
    func inputanswer(input: Bool){
        if (input == true){
            correctCount += 1
        }else{
            incorrectcount += 1
        }
    }
    
    func movetonextQuestion() -> Bool{
        if(currentQuestion == questionlist.count - 1){
            return false
        }else{
            currentQuestion += 1
            return true
            
        }
    }
    
    func giveTotalQuestionCount() -> Int{
        return questionlist.count
    }
    
    func giveincorrectquestioncount() -> Int{
        return incorrectcount
    }

    func giveCurrentQuestionValue() -> Int{
        return currentQuestion + 1
    }
    
    func givecorrectcount() -> Int{
        return correctCount
    }
    
    func reset(){
        currentQuestion = 0
        incorrectcount = 0
        correctCount = 0
    }
}


