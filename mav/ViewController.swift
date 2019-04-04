//
//  ViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var menu1: UITableView!
    
    @IBOutlet weak var imagemenu: UIImageView!
    
    
    
    
    
    let menu = ["Our Service","Request A Quote","Site Visit Report","Skill Set Form","Website","Contact"]

    var ref: Int = -1
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return (menu.count)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = menu[indexPath.row]
        return(cell)
    }

   /*
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! slideTableViewCell
        //cell.mymenu.image=UIImage(named: menu[indexPath.row]+".png")
    cell.mylbl.text=menu[indexPath.row]
        tableView.estimatedRowHeight = 2
        return (cell)
        
    }
 */
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        
            switch indexPath.row {
            case 0: //For "one"
                segueIdentifier = "servicesViewController"
            case 1: //For "two"
                segueIdentifier = "QuoteViewController"
            case 2: //For "two"
                segueIdentifier = "ReportViewController"
            case 3: //For "two"
                segueIdentifier = "SkillsViewController"
            case 4: //For "two"
                segueIdentifier = "WebViewController"
           
            default: //For "three"
                segueIdentifier = "ContactViewController"
        
        }
        
     self.performSegue(withIdentifier: segueIdentifier, sender: self)
        
        
    }
 
 
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ref = indexPath.row
        
        if(ref == 0)
        {
            
            performSegue(withIdentifier: "ourservices", sender: self)
        }
        if(ref == 1)
        {
            performSegue(withIdentifier: "quote", sender: self)
        }
        
        if(ref == 2)
        {
            performSegue(withIdentifier: "site", sender: self)
        }
        
        if(ref == 3)
        {
            performSegue(withIdentifier: "skill", sender: self)
        }
        
        if(ref == 4)
        {
            performSegue(withIdentifier: "web", sender: self)
        }
        
        if(ref == 5)
        {
            performSegue(withIdentifier: "contact", sender: self)
        }
        
        
        
        
    }
 
 */
    
    
    
    
    
    
  
   /* func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu1.tableFooterView = UIView()
        
        menu1.isHidden = true
        imagemenu.isHidden = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       

    @IBAction func menubutoleft(_ sender: Any) {
        
        menu1.isHidden = true
        imagemenu.isHidden = true
        
    }
    @IBAction func showmenuright(_ sender: Any) {
        
        menu1.isHidden = false
        imagemenu.isHidden = false
        
        
    }
}




