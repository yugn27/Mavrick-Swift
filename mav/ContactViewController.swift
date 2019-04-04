//
//  ContactViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
   
    @IBAction func back(_ sender: UIButton) {
    }

    @IBAction func menuCont(_ sender: UIButton) {
    }
  
       override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonwebview(_ sender: Any) {
        //let Username =  "instagram" // Your Instagram Username here
        //let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared
        
        
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://goo.gl/maps/aHoJHUWCPTk")!
            application.open(webURL)
    }
    
    
    
    
  
  /*  -(void)push{
    UIStoryboard * stry = self.storyboard;
    WViewController * wvc = [stry instantiateViewControllerWithIdentifier:@"WViewController"];
    NSString * UserName = self.txtuser.text;
    wvc.strUserName = UserName;
    [self.navigationController pushViewController:wvc animated:NO];
    }
    
    */
    
    
    
}
