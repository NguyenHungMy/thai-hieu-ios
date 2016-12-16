//
//  NewGameViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/13/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit
import CoreData

class NewGameViewController: UIViewController {

    var global:NSUserDefaults!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }
    
    @IBOutlet weak var txtUserName: UITextField!
    let alertSorry = UIAlertController(title: "Sorry!", message: "Input your name first!", preferredStyle: UIAlertControllerStyle.Alert)
    @IBAction func btnPlay(sender: AnyObject) {
        let whitespaceSet = NSCharacterSet.whitespaceCharacterSet()
        let contain = txtUserName.text
        if contain!.stringByTrimmingCharactersInSet(whitespaceSet).isEmpty {
                self.presentViewController(alertSorry, animated: true, completion: nil)
            print("rong")
        }
        else {
            // declare
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
                    person.setValue(false, forKey:"playing")
                    do{
                        //let result =
                        try person.managedObjectContext?.save()
                        print("set false done")
                    }
                    catch{
                        print("set false fail")
                    }
                }
            }
            catch{
                print("select fail")
            }

        // insert
            let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext:   context) as NSManagedObject
            newUser.setValue(txtUserName.text, forKey: "userName")
       
            do{
                try context.save()
                print("luu user thanh cong: " + txtUserName.text!)
            }
            catch{
                print("save fail")
            }
            global.setObject(txtUserName.text, forKey: "userName")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("chooseModeScreen")
            self.presentViewController(controller, animated: true, completion:nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
        
        alertSorry.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
        }))
        
    }
}
