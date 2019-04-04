//
//  TertiaryViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit

class TertiaryViewController: UIViewController
{
    // Note: this class is used in section "Passing Data Forward using Segues (A → B)"
    
    /// The username property that goes into the label
   
    
    
    var Projectnamepass = String()
    var NoDisplayspass = String()
    var NoSpeakerspass = String()
    var NoPAXpass = String()
    var RoomSelectoutletpass = String()
    var VideoConferenceoutletpass = String()
    var ControlSystemoutletpass = String()
    var SLDoutletpass = String()
    var DDrawingoutletpass = String()
    var TotalFinalpass = String()
    
    
    
    
    
    
    
    /// The label property

    
    
    @IBOutlet weak var projectnameoutlet: UITextField!
    
    @IBOutlet weak var Numberofdisplayout: UITextField!
    @IBOutlet weak var noofspeakersout: UITextField!
    @IBOutlet weak var noofpaxout: UITextField!
    @IBOutlet weak var videoconferenceoutlet: UITextField!
    @IBOutlet weak var controlsystemoutlet: UITextField!
    
    @IBOutlet weak var sldoutlet: UITextField!
    @IBOutlet weak var ddrawingoutlet: UITextField!
    
    @IBOutlet weak var roomtypeselectoroutlet: UITextField!
    @IBOutlet weak var totalcostoutlet: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set the label text
        //usernameLabel?.text = "Total cost = \(NoSpeakerspass)"
        
        
        projectnameoutlet.placeholder = "Project Name : \(Projectnamepass)"
        Numberofdisplayout.placeholder = "Number of Display : \(NoDisplayspass)"
        noofspeakersout.placeholder = "Number of Speaker : \(NoSpeakerspass)"
        noofpaxout.placeholder = "Number of PAX : \(NoPAXpass)"
        
        
        videoconferenceoutlet.placeholder = "Video Conference : \(VideoConferenceoutletpass)"
        
        controlsystemoutlet.placeholder = "Control System : \(ControlSystemoutletpass)"
        
        sldoutlet.placeholder = "SLD : \(SLDoutletpass)"
        
        ddrawingoutlet.placeholder = "3D Drawing : \(DDrawingoutletpass)"
        
        
        roomtypeselectoroutlet.placeholder = "Room Type : \(RoomSelectoutletpass)"
        
        totalcostoutlet.placeholder = "Total Cost : \(TotalFinalpass)"
        
        
        
        
        
        //print(Total)
        //print(VideoConferenceoutletpass)
        //print(Projectnamepass)
        //secondLabel.text =
    }
    
    
    
    @IBAction func Menu(_ sender: UIButton) {
    }
    
}
