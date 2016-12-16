//
//  HighScoreViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/15/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit
import CoreData

class HighScoreViewController: UIViewController {
    
    var global:NSUserDefaults!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lblNo1: UILabel!
    @IBOutlet weak var lblNo2: UILabel!
    @IBOutlet weak var lblNo3: UILabel!
    @IBOutlet weak var lblNo4: UILabel!
    @IBOutlet weak var lblNo5: UILabel!
    
    @IBOutlet weak var lblScore1: UILabel!
    @IBOutlet weak var lblScore2: UILabel!
    @IBOutlet weak var lblScore3: UILabel!
    @IBOutlet weak var lblScore4: UILabel!
    @IBOutlet weak var lblScore5: UILabel!
    
    var arrPlayer = [String]()
    var arrScore = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        // create predecate
        let predecate = NSPredicate(format: "playing=false")
        request.predicate = predecate
        request.sortDescriptors = [NSSortDescriptor(key: "score", ascending : false)]
        
      
        do {
            let results = try context.executeFetchRequest(request)
            if results.count == 0 {
                
            }
            var count=0
            for result:AnyObject in results {
                let text = String(result.valueForKey("userName") as! String)
                count++
                if count > 5 {
                    break
                }
                arrPlayer.append(text)
                arrScore.append(String(result.valueForKey("score") as! Int))
            }
            SetLabel(results.count)
        }
        catch{
            print("select fail")
        }
        
    }
    func SetLabel(count:Int) {
        if count == 0 {
        }
        else if count == 1 {
            lblNo1.text = arrPlayer[0]
            lblScore1.text = arrScore[0]
        } else if count == 2 {
            lblNo1.text = arrPlayer[0]
            lblNo2.text = arrPlayer[1]
            lblScore1.text = arrScore[0]
            lblScore2.text = arrScore[1]
        } else if count == 3 {
            lblNo1.text = arrPlayer[0]
            lblNo2.text = arrPlayer[1]
            lblNo3.text = arrPlayer[2]
            lblScore1.text = arrScore[0]
            lblScore2.text = arrScore[1]
            lblScore3.text = arrScore[2]
        } else if count == 4 {
            lblNo1.text = arrPlayer[0]
            lblNo2.text = arrPlayer[1]
            lblNo3.text = arrPlayer[2]
            lblNo4.text = arrPlayer[3]
            lblScore1.text = arrScore[0]
            lblScore2.text = arrScore[1]
            lblScore3.text = arrScore[2]
            lblScore4.text = arrScore[3]
        } else {
            lblNo1.text = arrPlayer[0]
            lblNo2.text = arrPlayer[1]
            lblNo3.text = arrPlayer[2]
            lblNo4.text = arrPlayer[3]
            lblNo5.text = arrPlayer[4]
            lblScore1.text = arrScore[0]
            lblScore2.text = arrScore[1]
            lblScore3.text = arrScore[2]
            lblScore4.text = arrScore[3]
            lblScore5.text = arrScore[4]
        }
    }
}
