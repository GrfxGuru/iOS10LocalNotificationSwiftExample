//
//  ViewController.swift
//  LocalNotificationExample
//
//  Created by Peter Witham on 3/10/17.
//  Copyright © 2017 Peter Witham. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNotificationSetupCheck()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
    }
    
    @IBAction func createNotification(_ sender: UIButton) {
        let notification = UNMutableNotificationContent()
        notification.title = "Danger Will Robinson"
        notification.subtitle = "Something This Way Comes"
        notification.body = "I need to tell you something, but first read this."
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: notification, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

