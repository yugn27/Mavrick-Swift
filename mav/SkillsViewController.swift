//
//  SkillsViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import UICheckbox_Swift

class SkillsViewController: UIViewController {
    
    @IBOutlet weak var fresheroutletseg: UISegmentedControl!

    //check box outlet
    @IBOutlet weak var accountmanagement: Checkbox!
    @IBOutlet weak var presentation: Checkbox!
    @IBOutlet weak var projectmonetring: Checkbox!
    @IBOutlet weak var coustmerrelationship: Checkbox!
    @IBOutlet weak var technicalupgrade: Checkbox!
    @IBOutlet weak var upselling: Checkbox!
    @IBOutlet weak var traning: Checkbox!
    @IBOutlet weak var amc: Checkbox!
    var id1 : String = ""
    
    //var declare
    var accountmanagementvar = "No"
    var presentationvar = "No"
    var projectmonetringvar = "No"
    var coustmerrelationshipvar = "No"
    var technicalupgradevar = "No"
    var upsellingvar = "No"
    var traningvar = "No"
    var amcvar = "No"
    
    var ref : DatabaseReference!

    @IBAction func Menu(_ sender: UIButton) {
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(id1)

        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        //FirebaseApp.configure()
        ref =  Database.database().reference()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //
    var Fresherssegmentctr = "Freshers"
    
    //segment control
    @IBAction func segmentcontrolfresher(_ sender: Any) {
        switch fresheroutletseg.selectedSegmentIndex
        {
        case 0:
            Fresherssegmentctr = "Freshers";
        case 1:
            Fresherssegmentctr = "2 yers";
        case 2:
            Fresherssegmentctr = "5 yers";
        case 3:
            Fresherssegmentctr = "6 yers";
        default:
            break;
        }
    }
    
    
    
    
    
    @IBAction func submitbuttonpage2(_ sender: Any) {
        
    
        
        if (accountmanagement.isChecked == true)
        {
            accountmanagementvar = "Yes";
        }
        else{
            accountmanagementvar = "No";
        }
        
        
        if (presentation.isChecked == true)
        {
            presentationvar = "Yes";
        }
        else{
            presentationvar = "No";
        }
        
        
        if (projectmonetring.isChecked == true)
        {
            projectmonetringvar = "Yes";
        }
        else{
            projectmonetringvar = "No";
        }
        
        
        if (coustmerrelationship.isChecked == true)
        {
            coustmerrelationshipvar = "Yes";
        }
        else{
            coustmerrelationshipvar = "No";
        }
        
        if (technicalupgrade.isChecked == true)
        {
            technicalupgradevar = "Yes";
        }
        else{
            technicalupgradevar = "No";
        }
        
        
        if (upselling.isChecked == true)
        {
            upsellingvar = "Yes";
        }
        else{
            upsellingvar = "No";
        }
        
        
        
        if (traning.isChecked == true)
        {
            traningvar = "Yes";
        }
        else{
            traningvar = "No";
        }
        
        
        if (amc.isChecked == true)
        {
            amcvar = "Yes";
        }
        else{
            amcvar = "No";
        }
        
        
        
    
        
        
        //purpose of visit
        self.ref.child(id1).child("otherskill").setValue(["Account Management":accountmanagementvar,"Presentations":presentationvar,"Project Monitoring":projectmonetringvar,"Customer Relationship":coustmerrelationshipvar,"Technical Upgrades":technicalupgradevar,"UpSelling":upsellingvar,"Training":traningvar,"AMC":amcvar,"Experience":Fresherssegmentctr])
         myalert("Sucess", "Skills Entered Sucessfully")
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         self.navigationController?.pushViewController(vc, animated: true)

    }
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        self.navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
