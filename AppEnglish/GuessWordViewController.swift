//
//  GuessWordViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/15/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit
import CoreData
import AVFoundation

class GuessWordViewController: UIViewController {

    var turnGuess:Int = 15
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblMode: UILabel!
    
    @IBOutlet weak var lblTurnGuess: UILabel!
    
    @IBOutlet weak var lblPlay: UIButton!
    
    @IBOutlet weak var lblA: UIButton!
    @IBOutlet weak var lblB: UIButton!
    @IBOutlet weak var lblC: UIButton!
    @IBOutlet weak var lblD: UIButton!
    
    //
    var audioPlayer : AVAudioPlayer!
    var global:NSUserDefaults!
    var questionNumber:Int = 0
    var score:Int = 0
    var diffScore:Int = 1
    var rightAnswer:String = ""
    //
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
    //
    let alertCongratulation = UIAlertController(title: "Congratulation! +1 SCORE!", message: "Next question?", preferredStyle: UIAlertControllerStyle.Alert)
    let alertSorry = UIAlertController(title: "Opps! It's almost right!", message: "Try another question?", preferredStyle: UIAlertControllerStyle.Alert)
    let alertOutQuestion = UIAlertController(title: "No more question in this mode!", message: "Get more score at another mode", preferredStyle: UIAlertControllerStyle.Alert)
    let alertTurnOver = UIAlertController(title: "Sorry!", message: "You have no more turn", preferredStyle: UIAlertControllerStyle.Alert)
    //
    func ChangeColorWrongAnswer(mode:Int, quesID:Int) {
        let realQuesID = quesID - 1
        
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
    
    @IBAction func btnPlay(sender: AnyObject) {
        
        if turnGuess == 0 {
            // thong bao het luot choi
            self.presentViewController(alertTurnOver, animated: true, completion: nil)
        }
        else
        {
            audioPlayer.play()
            turnGuess--
            lblTurnGuess.text = "Turn: " + String(turnGuess)
        }
    }
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        questionNumber = Int(global.objectForKey("questionNumber") as! String)!
        
        score = Int(global.objectForKey("score") as! String)!
        
        
        // questions
        arrQuestionEasy.append("e-combine")
        arrQuestionEasy.append("e-start")
        arrQuestionEasy.append("e-though")
        
        arrQuestionNormal.append("n-blue")
        arrQuestionNormal.append("n-file")
        arrQuestionNormal.append("n-sight")
        
        arrQuestionHard.append("h-chord")
        arrQuestionHard.append("h-fare")
        arrQuestionHard.append("h-flower")
        // right answer
        arrAnswerEasy.append("A")
        arrAnswerEasy.append("B")
        arrAnswerEasy.append("B")
        
        arrAnswerNormal.append("C")
        arrAnswerNormal.append("D")
        arrAnswerNormal.append("C")
        
        arrAnswerHard.append("A")
        arrAnswerHard.append("D")
        arrAnswerHard.append("D")
        // answer A
        arrEasyA.append("A: Combine")
        arrEasyA.append("A: Star")
        arrEasyA.append("A: Throught")
        
        arrNormalA.append("A: Blew")
        arrNormalA.append("A: Fire")
        arrNormalA.append("A: Site")
        
        arrHardA.append("A: Chord")
        arrHardA.append("A: Fair")
        arrHardA.append("A: Flow")
        // answer B
        arrEasyB.append("B: Compare")
        arrEasyB.append("B: Start")
        arrEasyB.append("B: Though")
        
        arrNormalB.append("B: Blown")
        arrNormalB.append("B: Fight")
        arrNormalB.append("B: Sign")
        
        arrHardB.append("B: Cord")
        arrHardB.append("B: Faired")
        arrHardB.append("B: Float")
        
        // answer C
        arrEasyC.append("C: Blue")
        arrEasyC.append("C: Started")
        arrEasyC.append("C: Told")
        
        arrNormalC.append("C: Bottle water")
        arrNormalC.append("C: Fine")
        arrNormalC.append("C: Sight")
        
        arrHardC.append("C: Cordon")
        arrHardC.append("C: Face")
        arrHardC.append("C: Flash")
        // answer D
        arrEasyD.append("D: Complete")
        arrEasyD.append("D: State")
        arrEasyD.append("D: Tongle")
        
        arrNormalD.append("D: Plure")
        arrNormalD.append("D: File")
        arrNormalD.append("D: Sine")
        
        arrHardD.append("D: Cordial")
        arrHardD.append("D: Fare")
        arrHardD.append("D: Flower")
        
        // get column Qes
        
        if global.objectForKey("gameMode") as! Int == 1 {
            diffScore = 1
            columnQues = "questionGuessWordEasy"
        }
        else if global.objectForKey("gameMode") as! Int == 2 {
            diffScore = 2
            columnQues = "questionGuessWordNormal"
        }
        else {
            diffScore = 3
            columnQues = "questionGuessWordHard"
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
        alertTurnOver.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            
        }))
        
        
        //
        if questionNumber > 3 {
            let triggerTime = (Int64(NSEC_PER_MSEC) * 1)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                self.lblA.setTitle("", forState: .Normal)
                self.lblB.setTitle("", forState: .Normal)
                self.lblC.setTitle("", forState: .Normal)
                self.lblD.setTitle("", forState: .Normal)
                self.presentViewController(self.alertOutQuestion, animated: true, completion: nil)
            })
            
        }
        else {
            ShowQuestion(questionNumber)
        }
    }
    func ShowQuestion(quesID:Int) {
        if questionNumber > 3 {
            self.presentViewController(alertOutQuestion, animated: true, completion: nil)
        }
        else
        {
            UpdateData(score, numberQuestion: questionNumber)
           
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
                turnGuess = 15
                // load first question
                lblA.setTitle(String(arrEasyA[realQuesID]), forState: .Normal)
                lblB.setTitle(String(arrEasyB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrEasyC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrEasyD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerEasy[realQuesID]
                let audioPath = NSBundle.mainBundle().pathForResource(arrQuestionEasy[realQuesID], ofType: "mp3")
                
                if audioPath != nil {
                    let audioFileURL = NSURL.fileURLWithPath(audioPath!)
                    do{
                        
                        try audioPlayer = AVAudioPlayer(contentsOfURL: audioFileURL)
                    }catch{
                    }
                }
            }
            else if global.objectForKey("gameMode") as! Int == 2 {
                lblMode.text = "Normal"
                turnGuess = 7
                // load first question
                lblA.setTitle(String(arrNormalA[realQuesID]), forState: .Normal)
                lblB.setTitle(String(arrNormalB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrNormalC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrNormalD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerNormal[realQuesID]
                
                let audioPath = NSBundle.mainBundle().pathForResource(arrQuestionNormal[realQuesID], ofType: "mp3")
                
                if audioPath != nil {
                    let audioFileURL = NSURL.fileURLWithPath(audioPath!)
                    do{
                        
                        try audioPlayer = AVAudioPlayer(contentsOfURL: audioFileURL)
                    }catch{
                        
                    }
                    
                }
            }
            else {
                lblMode.text = "Hard"
                turnGuess = 3
                // load first question
                lblA.setTitle(String(arrHardA[realQuesID]), forState: .Normal)
                lblB.setTitle(String(arrHardB[realQuesID]), forState: .Normal)
                lblC.setTitle(String(arrHardC[realQuesID]), forState: .Normal)
                lblD.setTitle(String(arrHardD[realQuesID]), forState: .Normal)
                rightAnswer = arrAnswerHard[realQuesID]
                
                let audioPath = NSBundle.mainBundle().pathForResource(arrQuestionHard[realQuesID], ofType: "mp3")
                
                if audioPath != nil {
                    let audioFileURL = NSURL.fileURLWithPath(audioPath!)
                    do{
                        
                        try audioPlayer = AVAudioPlayer(contentsOfURL: audioFileURL)
                    }catch{
                        
                    }
                }
            }
            lblTurnGuess.text = "Turn: " + String(turnGuess)
            
            questionNumber = questionNumber + 1
        }
    }
    
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


}
