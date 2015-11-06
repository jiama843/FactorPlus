//
//  MultipleChoiceViewController.swift
//  Factor+
//
//  Created by Taehyun Lee on 2015-10-29.
//  Copyright © 2015 LYM. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    
    var ttlScore = Int(), numQuestions = Int()
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var choice4Button: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var progressMCF: UIProgressView!
 
    @IBAction func choice1Clicked(sender: AnyObject) {
        
    
        changeProgress()
    }
    @IBAction func choice2Clicked(sender: AnyObject) {
        
        changeProgress()
    }
    @IBAction func choice3Clicked(sender: AnyObject) {
        
        changeProgress()
    }
    @IBAction func choice4Clicked(sender: AnyObject) {
        
       changeProgress()
    }
    
    func changeProgress(){
        numQuestions++
        var temp = Double(numQuestions)/10
        progressMCF.setProgress(Float(temp), animated: true)
        endGame()
    }
    
    @IBAction func pauseClicked(sender: AnyObject) {
        performSegueWithIdentifier("pauseMCF", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var temp = Double(numQuestions)/10
        progressMCF.setProgress(Float(temp), animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endGame() {
        if(numQuestions == 10)
        {
            performSegueWithIdentifier("endMCF", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "pauseMCF")
        {
            let pvc = segue.destinationViewController as! PauseViewController
            
            pvc.score = ttlScore
            pvc.numQuestion = numQuestions
            pvc.type = "Multiple Choice Factor"
        }
        else if(segue.identifier == "endMCF")
        {
            let evc = segue.destinationViewController as! EndViewController
            evc.numCorrect = ttlScore
            evc.type = "Multiple Choice Factor"
        }
    }
    
}
