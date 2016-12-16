//
//  ChooseModeViewController.swift
//  AppEnglish
//
//  Created by Nguyễn Hùng Mỹ on 12/13/16.
//  Copyright © 2016 ThaiHieu. All rights reserved.
//

//import Cocoa
import UIKit

class ChooseModeViewController: UIViewController {

    var gameMode:Int = 1
    
    @IBOutlet weak var lblHello: UILabel!
   
    var global:NSUserDefaults!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        global.setObject(gameMode, forKey: "gameMode")
    }
    @IBAction func btnEasy(sender: AnyObject) {
       gameMode = 1
    }
    
    @IBAction func btnNormal(sender: AnyObject) {
        gameMode = 2
    }
    
    
    @IBAction func btnHard(sender: AnyObject) {
        gameMode = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        global = NSUserDefaults()
         lblHello.text = "Hi, " + String(global.objectForKey("userName") as! String)
       
    }
}
