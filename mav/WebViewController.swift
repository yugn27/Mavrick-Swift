//
//  WebViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {

    @IBAction func back(_ sender: UIButton) {
    }
    
    @IBAction func menuCont(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        let application = UIApplication.shared
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://www.cliqueav-india.com/")!
        application.open(webURL)
    }
    
    
    
    @IBAction func websiteopner(_ sender: Any) {
        
        let application = UIApplication.shared
        
        
        // if Instagram app is not installed, open URL inside Safari
        let webURL = URL(string: "http://www.cliqueav-india.com/")!
        application.open(webURL)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

