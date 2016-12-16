//
//  ViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/13/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    var userName:String=""
    var score:Int = 0
    var global:NSUserDefaults!
    
    @IBOutlet weak var lblContinue: UIButton!
    
    @IBAction func btnContinue(sender: AnyObject) {
    }

    @IBAction func btnNewGame(sender: AnyObject) {
        
    }
    
    @IBAction func btnHighScore(sender: AnyObject) {
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        
        
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
            if results.count == 0 {
                lblContinue.hidden = true
            }
            
            print (results.count)
            for result:AnyObject in results {
                userName = result.valueForKey("userName") as! String
                score = result.valueForKey("score") as! Int
                
            }
        }
        catch{
            print("select fail")
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print(userName)
        
            
        global.setObject(userName , forKey: "userName")
        global.setObject(score , forKey: "score")
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

