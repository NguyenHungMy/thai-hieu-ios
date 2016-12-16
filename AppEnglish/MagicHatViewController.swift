//
//  MagicHatViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/14/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit
import CoreData
import AVFoundation

class MagicHatViewController: UIViewController {
    
    @IBOutlet weak var lblA: UIButton!
    
    var global:NSUserDefaults!
    var questionNumber:Int = 0
    var score:Int = 0
    
    var diffScore:Int = 1
    
    
    let alertCongratulation = UIAlertController(title: "Congratulation! +1 SCORE!", message: "Next question?", preferredStyle: UIAlertControllerStyle.Alert)
   let alertSorry = UIAlertController(title: "Sorry! It's almost right!", message: "Try another question?", preferredStyle: UIAlertControllerStyle.Alert)
    let alertOutQuestion = UIAlertController(title: "No more question in this mode!", message: "Get more score at another mode", preferredStyle: UIAlertControllerStyle.Alert)
    let alertTimeOver = UIAlertController(title: "Time Over!", message: "Keep trying with next question", preferredStyle: UIAlertControllerStyle.Alert)
    
    func ChangeColorWrongAnswer(mode:Int, quesID:Int) {
        let realQuesID = quesID - 2
        print("color")
        print(realQuesID)
        if mode == 1 {
            if arrAnswerEasy[realQuesID] == "A" {
                lblA.backgroundColor = UIColor.redColor()
            } else if arrAnswerEasy[realQuesID] == "B" {
                lblB.backgroundColor = UIColor.redColor()
            } else if arrAnswerEasy[realQuesID] == "C" {
                lblC.backgroundColor = UIColor.redColor()
            } else {
                lblD.backgroundColor = UIColor.redColor()
            }
        }
        else if mode == 2 {
            if arrAnswerNormal[realQuesID] == "A" {
                lblA.backgroundColor = UIColor.redColor()
            } else if arrAnswerNormal[realQuesID] == "B" {
                lblB.backgroundColor = UIColor.redColor()
            } else if arrAnswerNormal[realQuesID] == "C" {
                lblC.backgroundColor = UIColor.redColor()
            } else {
                lblD.backgroundColor = UIColor.redColor()
            }
        }
        else {
            if arrAnswerHard[realQuesID] == "A" {
                lblA.backgroundColor = UIColor.redColor()
            } else if arrAnswerHard[realQuesID] == "B" {
                lblB.backgroundColor = UIColor.redColor()
            } else if arrAnswerHard[realQuesID] == "C" {
                lblC.backgroundColor = UIColor.redColor()
            } else {
                lblD.backgroundColor = UIColor.redColor()
            }
        }
    }
    @IBOutlet weak var lblMode: UILabel!
    
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    var rightAnswer:String = ""
    @IBAction func btnA(sender: AnyObject) {
        if rightAnswer == "A" {
            lblA.backgroundColor = UIColor.greenColor()
            score = score + diffScore
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertCongratulation, animated: true, completion: nil)
            
        }
        else {
            ChangeColorWrongAnswer(global.objectForKey("gameMode") as! Int, quesID: questionNumber)
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertSorry, animated: true, completion: nil)
        }
        
        
    }
    
    @IBOutlet weak var lblB: UIButton!
    @IBAction func btnB(sender: AnyObject) {
        if rightAnswer == "B" {
            lblB.backgroundColor = UIColor.greenColor()
            score = score + diffScore
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertCongratulation, animated: true, completion: nil)
            
        }
        else {
            ChangeColorWrongAnswer(global.objectForKey("gameMode") as! Int, quesID: questionNumber)
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertSorry, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var lblC: UIButton!
    @IBAction func btnC(sender: AnyObject) {
        if rightAnswer == "C" {
            lblC.backgroundColor = UIColor.greenColor()
            score = score + diffScore
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertCongratulation, animated: true, completion: nil)
            
        }
        else {
           ChangeColorWrongAnswer(global.objectForKey("gameMode") as! Int, quesID: questionNumber)
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertSorry, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var lblD: UIButton!
    @IBAction func btnD(sender: AnyObject) {
        if rightAnswer == "D" {
           lblD.backgroundColor = UIColor.greenColor()
            score++
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertCongratulation, animated: true, completion: nil)
            
        }
        else {
           ChangeColorWrongAnswer(global.objectForKey("gameMode") as! Int, quesID: questionNumber)
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertSorry, animated: true, completion: nil)
        }
        
    }
    
    
    @IBOutlet weak var lblScore: UILabel!
    
    
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    var arrQuestionEasy = [String]()
    var arrAnswerEasy = [String]()
    var arrQuestionNormal = [String]()
    var arrAnswerNormal = [String]()
    var arrQuestionHard = [String]()
    var arrAnswerHard = [String]()
    
    var arrEasyA = [String]()
    var arrNormalA = [String]()
    var arrHardA = [String]()
    var arrEasyB = [String]()
    var arrNormalB = [String]()
    var arrHardB = [String]()
    var arrEasyC = [String]()
    var arrNormalC = [String]()
    var arrHardC = [String]()
    var arrEasyD = [String]()
    var arrNormalD = [String]()
    var arrHardD = [String]()
    
    var columnQues:String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        questionNumber = Int(global.objectForKey("questionNumber") as! String)!
       
        score = Int(global.objectForKey("score") as! String)!
        
        
        // questions
        arrQuestionEasy.append("A building that people, usually one family, live in")
        arrQuestionEasy.append("A computer that is smallenough to be carried aroundeasily and is flat when closed")
        arrQuestionEasy.append("An area of sand or small stones near the sea or another area of water such as a lake")
        
        arrQuestionNormal.append("A piece of glass with ashiny, metal-covered back that reflects light, producing an image of whatever is in front of it")
        arrQuestionNormal.append("A natural wide flow of fresh water across the land into the sea, a lake, or another river")
        arrQuestionNormal.append("A structure that is built over a river, road, or rail way to allow people and vehicles to cross from one side to the other")
        
        arrQuestionHard.append("A sudden violent movement of the earth’s surface, sometimes causing great damage")
        arrQuestionHard.append("Any imaginary frightening creature, especially one that is large and strange")
        arrQuestionHard.append("A device sent up into space to travel around the earth, used for collecting information or communicating by radio, television, etc")
        // right answer
        arrAnswerEasy.append("D")
        arrAnswerEasy.append("A")
        arrAnswerEasy.append("B")
        
        arrAnswerNormal.append("A")
        arrAnswerNormal.append("B")
        arrAnswerNormal.append("C")
        
        arrAnswerHard.append("A")
        arrAnswerHard.append("D")
        arrAnswerHard.append("D")
        // answer A
        arrEasyA.append("A: Hotel")
        arrEasyA.append("A: Laptop")
        arrEasyA.append("A: Mountaint")
        
        arrNormalA.append("A: Mirror")
        arrNormalA.append("A: Lake")
        arrNormalA.append("A: Boat")
        
        arrHardA.append("A: Earthquake")
        arrHardA.append("A: Iphone")
        arrHardA.append("A: Television")
        // answer B
        arrEasyB.append("B: Restaurant")
        arrEasyB.append("B: Smart phone")
        arrEasyB.append("B: River")
      
        arrNormalB.append("B: Gas")
        arrNormalB.append("B: River")
        arrNormalB.append("B: Cano")
        
        arrHardB.append("B: Storm")
        arrHardB.append("B: Radio")
        arrHardB.append("B: Antena")
        
        // answer C
        arrEasyC.append("C: Motel")
        arrEasyC.append("C: Microphone")
        arrEasyC.append("C: Beach")
        
        arrNormalC.append("C: Bottle water")
        arrNormalC.append("C: Ocean")
        arrNormalC.append("C: Bridge")
        
        arrHardC.append("C: Tsunami")
        arrHardC.append("C: Wireless network")
        arrHardC.append("C: Router")
        // answer D
        arrEasyD.append("D: House")
        arrEasyD.append("D: The beach")
        arrEasyD.append("D: Grass")
        
        arrNormalD.append("D: Glass")
        arrNormalD.append("D: Gas")
        arrNormalD.append("D: Station")
        
        arrHardD.append("D: Eruptions")
        arrHardD.append("D: Television")
        arrHardD.append("D: Satellite")
        
        // get column Qes
       
        if global.objectForKey("gameMode") as! Int == 1 {
            diffScore = 1
            columnQues = "questionMagicHatEasy"
        }
        else if global.objectForKey("gameMode") as! Int == 2 {
            diffScore = 2
            columnQues = "questionMagicHatNormal"
        }
        else {
            diffScore = 3
            columnQues = "questionMagicHatHard"
        }
        
        
        // arlet
        alertCongratulation.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            self.ShowQuestion(self.questionNumber)
        }))
        alertCongratulation.addAction(UIAlertAction(title: "Take a break", style: .Default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("startScreen")
            self.presentViewController(controller, animated: true, completion:nil)
        }))
        alertSorry.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            //self.questionNumber = self.questionNumber + 1
            self.ShowQuestion(self.questionNumber)
        }))
        alertSorry.addAction(UIAlertAction(title: "Take a break", style: .Default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("startScreen")
            self.presentViewController(controller, animated: true, completion:nil)
        }))
        alertOutQuestion.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("gameStyleScreen")
            self.presentViewController(controller, animated: true, completion:nil)

        }))
        alertTimeOver.addAction(UIAlertAction(title: "Next question", style: .Default, handler: { action in
           //self.questionNumber = self.questionNumber + 1
            self.ShowQuestion(self.questionNumber)
        }))
        

        //
        if questionNumber > 3 {
            let triggerTime = (Int64(NSEC_PER_MSEC) * 1)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                self.lblA.setTitle("", forState: .Normal)
                self.lblB.setTitle("", forState: .Normal)
                self.lblC.setTitle("", forState: .Normal)
                self.lblD.setTitle("", forState: .Normal)
                self.lblQuestion.text = nil
                self.presentViewController(self.alertOutQuestion, animated: true, completion: nil)
            })
            
        }
        else {
            ShowQuestion(questionNumber)
        }
    }
    // func update score and numberQuestion
    func UpdateData(score:Int, numberQuestion:Int) {
        // get column name to store question number
        
        // set question Number
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        // select
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        // create predecate
        let predecate = NSPredicate(format: "playing=true")
        request.predicate = predecate
        
        do {
            let results = try context.executeFetchRequest(request)
            
            for result:AnyObject in results {
                let person = result as! NSManagedObject
                person.setValue(score, forKey:"score")
                person.setValue((questionNumber + 1) as Int, forKey: columnQues)
                do{
                    
                    try person.managedObjectContext?.save()
                    print("cap nhat diem thanh cong")
                    
                }
                catch{
                   print ("cap nhat score, quesID loi~")
                }
            }
        }
        catch{
            
        }
        
        
    }
    //
    var timeCount:Int = 60
    var myTimer:NSTimer!
    func ShowQuestion(quesID:Int) {
        if questionNumber > 3 {
            self.presentViewController(alertOutQuestion, animated: true, completion: nil)
        }
        else
        {
            UpdateData(score, numberQuestion: questionNumber)
            timeCount=60
            myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
 
            //
            let realQuesID:Int = quesID - 1
            print(questionNumber)
            lblA.backgroundColor = nil
            lblB.backgroundColor = nil
            lblC.backgroundColor = nil
            lblD.backgroundColor = nil
        
            //
            lblScore.text = "Score: " + String(score)
            lblQuestionNumber.text = "Question: " + String(questionNumber)
            // set mode
            if global.objectForKey("gameMode") as! Int == 1 {
                lblMode.text = "Easy"
                // load first question
                lblQuestion.text = arrQuestionEasy[realQuesID]
                lblA.setTitle(String(arrEasyA[realQuesID]), forState: .Normal)
                lblB.setTitle(String(arrEasyB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrEasyC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrEasyD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerEasy[realQuesID]
            }
            if global.objectForKey("gameMode") as! Int == 2 {
                lblMode.text = "Normal"
                // load first question
                lblQuestion.text = arrQuestionNormal[realQuesID]
                lblA.setTitle(String(arrNormalA[realQuesID]), forState: .Normal)
                    lblB.setTitle(String(arrNormalB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrNormalC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrNormalD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerNormal[realQuesID]
            }
            if global.objectForKey("gameMode") as! Int == 3 {
                lblMode.text = "Hard"
                // load first question
                lblQuestion.text = arrQuestionHard[realQuesID]
                lblA.setTitle(String(arrHardA[realQuesID]), forState: .Normal)
                lblB.setTitle(String(arrHardB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrHardC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrHardD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerHard[realQuesID]
                }
            
            questionNumber = questionNumber + 1
            }
        
        
    
        }
    func Counting() {
        if timeCount > 0 {
            lblTime.text = "\(timeCount)"
            timeCount -= 1
        } else {
            myTimer.invalidate()
            lblTime.text = "0"
            ChangeColorWrongAnswer(global.objectForKey("gameMode") as! Int, quesID: questionNumber)
            UpdateData(score, numberQuestion: questionNumber)
            self.presentViewController(alertTimeOver, animated: true, completion: nil)
        }
    }
}