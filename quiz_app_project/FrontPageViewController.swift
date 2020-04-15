//
//  FrontPageViewController.swift
//  quiz_app_project
//
//  Created by Ravinder on 2020-04-11.
//  Copyright © 2020 Ravinder. All rights reserved.
//

import UIKit

class FrontPageViewController: UIViewController {
    
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var learnbutton: UIButton!
    
    @IBOutlet weak var info: UILabel!
    
    var quizModule:quiz = quiz.init()

    @IBAction func Startpress(_ sender: Any) {
        performSegue(withIdentifier: "startToQuiz", sender: nil)
        
   }
    @IBAction func learnpreess(_ sender: Any) {
        performSegue(withIdentifier: "starttolearn", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 3, animations: {
            self.info.center.x -= self.view.bounds.width
           
        }, completion: nil)
      
        let startAnimation = constructScaleAnimation(startingScale: 0.8, endingScale: 1.4, animationDuration: 2.5)
        let learnanimation = constructScaleAnimation(startingScale: 1, endingScale: 1.2, animationDuration: 2)
               startbutton.layer.add(startAnimation, forKey: "scale")
        learnbutton.layer.add(learnanimation,forKey: "scale")
        
    }
    
    func constructScaleAnimation(startingScale: CGFloat, endingScale: CGFloat, animationDuration: Double) -> CABasicAnimation {
         let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
         scaleAnimation.fromValue = startingScale
         scaleAnimation.toValue = endingScale
         scaleAnimation.duration = animationDuration
         scaleAnimation.autoreverses = true
         scaleAnimation.repeatCount  = Float.infinity
         return scaleAnimation
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startToQuiz"){
                var seg = segue.destination as! QuizViewController
            seg.quizModule = self.quizModule 
            
        }
        if(segue.identifier == "starttolearn"){
                       var seg = segue.destination as! learnViewController
                   seg.quizModule = self.quizModule
                   
               }
      
  
    }
  

}
