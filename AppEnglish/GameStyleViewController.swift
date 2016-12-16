//
//  GameStyleViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/14/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit
import CoreData

class GameStyleViewController: UIViewController {
    
    var gameStyle:Int = 1
    var score:Int = 0
    var numberOfQuestion:Int = 0
    var stringConvert:String = ""
    
    var global:NSUserDefaults!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        global.setObject(gameStyle, forKey: "gameStyle")
        global.setObject(String(score), forKey:"score")
    }
    

    @IBAction func btnMagicHat(sender: AnyObject) {
        gameStyle = 1
        if global.objectForKey("gameMode") as! Int == 1 {
            stringConvert = String(questionMagicHatEasy)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 2 {
            stringConvert = String(questionMagicHatNormal)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 3 {
            stringConvert = String(questionMagicHatHard)
            global.setObject( stringConvert, forKey: "questionNumber")
        }
    }
    
    @IBAction func btnGuessWord(sender: AnyObject) {
        gameStyle = 2
        if global.objectForKey("gameMode") as! Int == 1 {
            stringConvert = String(questionGuessWordEasy)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 2 {
            stringConvert = String(questionGuessWordNormal)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 3 {
            stringConvert = String(questionGuessWordHard)
            global.setObject( stringConvert, forKey: "questionNumber")
        }
    }
    
    @IBAction func btnGuessImage(sender: AnyObject) {
        gameStyle = 3
        if global.objectForKey("gameMode") as! Int == 1 {
            stringConvert = String(questionGuessImageEasy)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 2 {
            stringConvert = String(questionGuessImageNormal)
            global.setObject( stringConvert, forKey: "questionNumber")
        } else if global.objectForKey("gameMode") as! Int == 3 {
            stringConvert = String(questionGuessImageHard)
            global.setObject( stringConvert, forKey: "questionNumber")
        }
    }
    // whole declare
    var questionMagicHatEasy:Int = 1
    var questionMagicHatNormal:Int = 1
    var questionMagicHatHard:Int = 1
    
    var questionGuessWordEasy:Int = 1
    var questionGuessWordNormal:Int = 1
    var questionGuessWordHard:Int = 1
    
    var questionGuessImageEasy:Int = 1
    var questionGuessImageNormal:Int = 1
    var questionGuessImageHard:Int = 1
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        //
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        // create predecate
        let predecate = NSPredicate(format: "playing=true")
        request.predicate = predecate
        //var results:AnyObject
        do {
            let results = try context.executeFetchRequest(request)
           

            for result:AnyObject in results {
                questionMagicHatEasy = result.valueForKey("questionMagicHatEasy") as! Int
                questionMagicHatNormal = result.valueForKey("questionMagicHatNormal") as! Int
                questionMagicHatHard = result.valueForKey("questionMagicHatHard") as! Int
                
                questionGuessWordEasy = result.valueForKey("questionGuessWordEasy") as! Int
                questionGuessWordNormal = result.valueForKey("questionGuessWordNormal") as! Int
                questionGuessWordHard = result.valueForKey("questionGuessWordHard") as! Int
                
                questionGuessImageEasy = result.valueForKey("questionGuessImageEasy") as! Int
                questionGuessImageNormal = result.valueForKey("questionGuessImageNormal") as! Int
                questionGuessImageHard = result.valueForKey("questionGuessImageHard") as! Int
                score = result.valueForKey("score") as! Int
            }
        }
        catch{
            print("select fail")
        }
        
        

    }
    
    
}
