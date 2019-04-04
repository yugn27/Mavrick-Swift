//
//  Skill.swift
//  Mavrick
//
//  Created by Vishitosh Vijay Kapale on 21/11/18.
//  Copyright © 2018 Vishitosh Vijay Kapale. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Skill: UIViewController, UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    var ref : DatabaseReference!
   
    var id1: String = " "
    
    
  
    
    
    @IBOutlet weak var documentation: UIView!
    @IBOutlet weak var project: UIView!
    @IBOutlet weak var troubleshooting: UIView!
    @IBOutlet weak var routing: UIView!
    @IBOutlet weak var maitenance: UIView!
    @IBOutlet weak var electrician: UIView!
    @IBOutlet weak var avdesigning: UIView!
    @IBOutlet weak var programing: UIView!
    @IBOutlet weak var fabrication: UIView!
    @IBOutlet weak var installation: UIView!
    @IBOutlet weak var interiordraughtsman: UIView!
    @IBOutlet weak var skilltbview: UITableView!
    
    
    
    let skilllist = ["Installation","Fabrication","Programing","AV Designing","Interior Draughtman","Electrician",
                     "Maintenance","Routing(Cabling)","Trouble Shooting","Project Management","Documentation"]
    var counter:Int = 0
    var store: String = ""
    var index:Int = 0
    var Skill = " "
    var subskill1 = " "
    var subskill2 = " "
    var subskill3 = " "
    var subskill4 = " "
    var subskill5 = " "
    var subskill6 = " "
    var subskill7 = " "
    var subskill8 = " "
    var choice: Int = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        ref = Database.database().reference()
       
        skilltbview.isHidden = true
        skilltbview.dataSource = self
        skilltbview.delegate = self
        
        
        installation.isHidden = true
        fabrication.isHidden = true
        programing.isHidden = true
        avdesigning.isHidden = true
        interiordraughtsman.isHidden = true
        electrician.isHidden = true
        maitenance.isHidden = true
        routing.isHidden = true
        troubleshooting.isHidden = true
        project.isHidden = true
        documentation.isHidden = true
        
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SkillsViewController") as! SkillsViewController
        vc.id1 = name.text!
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return skilllist.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell1 = UITableViewCell(style: .default, reuseIdentifier: "cell1")
        cell1.textLabel?.text = skilllist[indexPath.row]
        return(cell1)
    }
    
    

    
    @IBAction func dropdown(_ sender: UIButton) {
       

            skilltbview.isHidden = false
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        
        if(index == 0)
        {
            choice = 1
            Skill = "Installation"
            skilltbview.isHidden = true
            installation.isHidden = false
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden = true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
           
            
            
            
        }
        if(index == 1)
        {
            choice = 2
            Skill="Fabrication"
            skilltbview.isHidden = true
            fabrication.isHidden = false
            interiordraughtsman.isHidden = true
            installation.isHidden = true
            programing.isHidden = true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
           
            
        }
        
        if(index == 2)
        {
            choice = 3
            Skill="Programing"
            skilltbview.isHidden = true
            fabrication.isHidden = true
            interiordraughtsman.isHidden = true
            installation.isHidden = true
            programing.isHidden = false
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
           
            
        }
        
        
        if(index == 3)
        {
            choice = 4
            Skill = "Av Designing"
            skilltbview.isHidden = true
            fabrication.isHidden = true
            interiordraughtsman.isHidden = true
            installation.isHidden = true
            programing.isHidden = true
            avdesigning.isHidden = false
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
            
            
        }
        
        if(index == 4)
        {
            choice = 5
            Skill = "Interior Draught Man"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = false
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden  = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
        }
        
        if(index == 5)
        {
            choice = 6
            Skill = "Electrician"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = false
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
            
            
        }
        if(index == 6)
        {
            choice = 7
            Skill = "Maintenance"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = false
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
           
            
        }
        if(index == 7)
        {
            choice = 8
            Skill = "Routing(Cabling)"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = false
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = true
            
            
        }
        if(index == 8)
        {
            choice = 9
            Skill = "Troubleshooting"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = false
            project.isHidden = true
            documentation.isHidden = true
            
            
        }
        if(index == 9)
        {
            choice = 10
            Skill = "Project Management"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = false
            documentation.isHidden = true
            
            
        }
        if(index == 10)
        {
            choice = 11
            Skill = "Documentation"
            skilltbview.isHidden = true
            installation.isHidden = true
            interiordraughtsman.isHidden = true
            fabrication.isHidden = true
            programing.isHidden =  true
            avdesigning.isHidden = true
            electrician.isHidden = true
            maitenance.isHidden = true
            routing.isHidden = true
            troubleshooting.isHidden = true
            project.isHidden = true
            documentation.isHidden = false
            
            
        }
        
        }
    
    
    @IBOutlet weak var rack: Checkbox!
    @IBOutlet weak var toursound: Checkbox!
    @IBOutlet weak var video: Checkbox!
    @IBOutlet weak var Auditorium: Checkbox!
    @IBOutlet weak var videowall10: Checkbox!
    @IBOutlet weak var studio: Checkbox!
    @IBOutlet weak var audio: Checkbox!
    @IBOutlet weak var cinema: Checkbox!
    
    func installatinon1()
    {
        var installcounter : Int = 0
        if rack.isChecked == true{
            subskill1 = "Rack"
            installcounter = installcounter+1
           
        }
        if toursound.isChecked == true
        {
            subskill2 = "Tour Sound"
            installcounter = installcounter+1
         
        }
        if video.isChecked == true
        {
            subskill3 = "Video"
            installcounter = installcounter+1
           
        }
        if Auditorium.isChecked == true
        {
            subskill4 = "Auditorium"
            installcounter = installcounter+1
       
        }
        if videowall10.isChecked == true
        {
            subskill5 = "Video Wall"
            installcounter=installcounter+1
            
        }
        if studio.isChecked == true
        {
            subskill6 = "Studio"
            installcounter=installcounter+1
  
        }
        if audio.isChecked == true
        {
            subskill7 = "Audio"
            installcounter=installcounter+1
           
        }
        if cinema.isChecked == true
        {
            subskill8 = "Cinema"
            installcounter=installcounter+1
       
        }
        if rack.isChecked == false{
            subskill1 = ""
          
        }
        if toursound.isChecked == false
        {
            subskill2 = ""
            
        }
        if video.isChecked == false
        {
            subskill3 = ""
           
        }
        if Auditorium.isChecked == false
        {
            subskill4 = ""
            
        }
        if videowall10.isChecked == false
        {
            subskill5 = ""
           
        }
        if studio.isChecked == false
        {
            subskill6 = ""
           
        }
        if audio.isChecked == false
        {
            subskill7 = ""
            
        }
        if cinema.isChecked == false
        {
            subskill8 = ""
            
        }
       
        if installcounter == 3
        {
            if name.text == "" || contact.text == "" || email.text == ""
            {
                myalert("Error", "One of the text field is empty.")
                name.text=""
                email.text=""
                contact.text=""
                
                rack.isChecked = false
                toursound.isChecked = false
                video.isChecked = false
                Auditorium.isChecked = false
                videowall10.isChecked = false
                studio.isChecked = false
                audio.isChecked = false
                cinema.isChecked = false
                installcounter = 0
            }
            else {
               
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("SKills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                myalert("Sucess", "Skills Entered Sucessfully")
               
                
                rack.isChecked = false
                toursound.isChecked = false
                video.isChecked = false
                Auditorium.isChecked = false
                videowall10.isChecked = false
                studio.isChecked = false
                audio.isChecked = false
                cinema.isChecked = false
                installcounter = 0
            }
            
        }
        
        else
        {
        myalert("Error", "Please Select any 3")
            name.text=""
            email.text=""
            contact.text=""
            
            rack.isChecked = false
            toursound.isChecked = false
            video.isChecked = false
            Auditorium.isChecked = false
            videowall10.isChecked = false
            studio.isChecked = false
            audio.isChecked = false
            cinema.isChecked = false
            installcounter = 0
        }
        
        
        
            
        }

    
    

    @IBOutlet weak var ceiling: Checkbox!
    @IBOutlet weak var wall: Checkbox!
    @IBOutlet weak var table: Checkbox!
    @IBOutlet weak var floor: Checkbox!
    @IBOutlet weak var vc: Checkbox!
    @IBOutlet weak var videowall1: Checkbox!
    
    
    func fabrication1()
    {
        if videowall1.isChecked == true
        {
            subskill1 = "Video Wall"
        }
        if vc.isChecked == true
        {
            subskill2 = "VC"
        }
        if floor.isChecked == true
        {
            subskill3 = "Floor"
        }
        if table.isChecked == true
        {
            subskill4 = "Table"
        }
        if wall.isChecked == true
        {
            subskill5 = "Wall"
        }
        if ceiling.isChecked == true
        {
            subskill6 = "Ceiling"
        }
        
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            videowall1.isChecked = false
            vc.isChecked = false
            floor.isChecked = false
            table.isChecked = false
            wall.isChecked = false
            ceiling.isChecked = false
            
            
        }
        else {
            
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                myalert("Sucess", "Skills Entered Sucessfully")
          
            
           
            
           
            
            videowall1.isChecked = false
            vc.isChecked = false
            floor.isChecked = false
            table.isChecked = false
            wall.isChecked = false
            ceiling.isChecked = false
        }
       
        
        
        
    }
   
   
    
    @IBOutlet weak var matrixswitcher: Checkbox!
    @IBOutlet weak var multiconferencing: Checkbox!
    @IBOutlet weak var roomschedule: Checkbox!
    @IBOutlet weak var videowall3: Checkbox!
    @IBOutlet weak var controlprocessor: Checkbox!
    @IBOutlet weak var dsp: Checkbox!
    
    
    func programing1()
    {
        var programcounter:Int = 0
        
        if dsp.isChecked == true
        {
            subskill1 = "DSP"
            programcounter = programcounter+1
        }
        if controlprocessor.isChecked == true
        {
            subskill2 = "Control Processor"
            programcounter = programcounter+1
        }
        if videowall3.isChecked == true
        {
            subskill3 = "Video Wall"
            programcounter = programcounter+1
        }
        if roomschedule.isChecked == true
        {
            subskill4 = "Room Schedule"
            programcounter = programcounter+1
        }
        if multiconferencing.isChecked == true
        {
            subskill5 = "Matrix Switcher"
            programcounter = programcounter+1
        }
        if dsp.isChecked == false
        {
            subskill1 = ""
           
        }
        if controlprocessor.isChecked == false
        {
            subskill2 = ""
            
        }
        if videowall3.isChecked == false
        {
            subskill3 = ""
           
        }
        if roomschedule.isChecked == false
        {
            subskill4 = ""
            
        }
        if multiconferencing.isChecked == false
        {
            subskill5 = ""
          
        }
       if programcounter == 2
       {
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            dsp.isChecked = false
            controlprocessor.isChecked = false
            videowall3.isChecked = false
            roomschedule.isChecked = false
            multiconferencing.isChecked = false
            programcounter = 0
        }
        else
        {
            
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                  myalert("Sucess", "Skills Entered Sucessfully")
          
            
            dsp.isChecked = false
            controlprocessor.isChecked = false
            videowall3.isChecked = false
            roomschedule.isChecked = false
            multiconferencing.isChecked = false
            programcounter = 0
        }
        
        
        
       }
       else
       {
        myalert("Error", "Please Select any 2")
        name.text=""
        email.text=""
        contact.text=""
        
        dsp.isChecked = false
        controlprocessor.isChecked = false
        videowall3.isChecked = false
        roomschedule.isChecked = false
        multiconferencing.isChecked = false
        
        programcounter = 0
        }
        
}
    
   
    
    @IBOutlet weak var shopdrawing: Checkbox!
    @IBOutlet weak var sow: Checkbox!
    @IBOutlet weak var gfc: Checkbox!
    @IBOutlet weak var asbuilt: Checkbox!
    @IBOutlet weak var schematic: Checkbox!
    
    
    func avdesigning1()
    {
        if schematic.isChecked == true
        {
            subskill1 = "Schematic Line Diagram"
        }
        if asbuilt.isChecked ==  true
        {
            subskill2 = "As Built"
        }
        if gfc.isChecked == true
        {
            subskill3 = "Good for Construction"
        }
        if sow.isChecked == true
        {
            subskill4 = "Statement of Work"
        }
        if shopdrawing.isChecked == true
        {
            subskill5 = "Shop Drawing"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
          
            schematic.isChecked = false
            asbuilt.isChecked = false
            gfc.isChecked = false
            sow.isChecked = false
            shopdrawing.isChecked = false
            
           
        }
        else {
            
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                  myalert("Sucess", "Skills Entered Sucessfully")
          
            
            schematic.isChecked = false
            asbuilt.isChecked = false
            gfc.isChecked = false
            sow.isChecked = false
            shopdrawing.isChecked = false
        }
        
       
        }
    
    
    @IBOutlet weak var twod: Checkbox!
    @IBOutlet weak var walkthrough: Checkbox!
    @IBOutlet weak var threed: Checkbox!
    
    func interiordraught()
    {
        if twod.isChecked == true
        {
            subskill1 = "2D"
            
        }
        if threed.isChecked == true
        {
            subskill2 = "3D"
        }
        if walkthrough.isChecked == true
        {
            subskill3 = "Walkthrough"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            twod.isChecked = false
            threed.isChecked = false
            walkthrough.isChecked = false
            
            
            
            
        }
        else {
            
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                  myalert("Sucess", "Skills Entered Sucessfully")
           
            
            twod.isChecked = false
            threed.isChecked = false
            walkthrough.isChecked = false
            
        }
        
       
        }
    
   
    @IBOutlet weak var home: Checkbox!
    @IBOutlet weak var offices: Checkbox!
    @IBOutlet weak var government: Checkbox!
    @IBOutlet weak var audi: Checkbox!
    
    
    func electrician1()
    {
        var electriciancounter:Int = 0
        if audi.isChecked == true
        {
            subskill1 = "Auditorium"
            electriciancounter = electriciancounter+1
        }
        if government.isChecked == true
        {
            subskill2 = "Government"
            electriciancounter = electriciancounter+1
        }
        if offices.isChecked == true
        {
            subskill3 = "Offices"
            electriciancounter = electriciancounter+1
        }
        if home.isChecked == true{
            subskill4 = "Home"
            electriciancounter = electriciancounter+1
        }
        if audi.isChecked == false
        {
            subskill1 = ""
           
        }
        if government.isChecked == false
        {
            subskill2 = ""
            
        }
        if offices.isChecked == true
        {
            subskill3 = ""
           
        }
        if home.isChecked == true{
            subskill4 = ""
           
        }
        if electriciancounter == 2
        {
            if name.text == "" || contact.text == "" || email.text == ""
            {
                myalert("Error", "One of the text field is empty.")
                name.text=""
                email.text=""
                contact.text=""
                
                audi.isChecked = false
                government.isChecked = false
                offices.isChecked = false
                home.isChecked = false
                electriciancounter = 0
                
                
                
            }
            else {
                
                let name1:String = name.text!
                let email1:String = email.text!
                let contact1:String = contact.text!
                self.ref.child(name1).child("SKills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                    myalert("Sucess", "Skills Entered Sucessfully")
              
                audi.isChecked = false
                government.isChecked = false
                offices.isChecked = false
                home.isChecked = false
                electriciancounter = 0
            }
            
            
            
        }
        else{
            myalert("Error", "Please Select any 2")
            name.text=""
            email.text=""
            contact.text=""
            
            audi.isChecked = false
            government.isChecked = false
            offices.isChecked = false
            home.isChecked = false
           
            
            electriciancounter = 0
            
        }
        
      
    }
    
    
   
    @IBOutlet weak var audi2: Checkbox!
    @IBOutlet weak var noc: Checkbox!
    @IBOutlet weak var videoconfe: Checkbox!
    @IBOutlet weak var audiconfe: Checkbox!
    
    
    func maintenance1()
    {
        var maintenancecounter: Int = 0
        if videoconfe.isChecked == true
        {
            subskill1 = "Video Conferencing"
            maintenancecounter = maintenancecounter+1
        }
        if noc.isChecked == true
        {
            subskill2 = "Network Operation Centers"
            maintenancecounter = maintenancecounter+1

        }
        if audi2.isChecked == true
        {
            subskill3 = "Auditorium"
            maintenancecounter = maintenancecounter+1

        }
        if audiconfe.isChecked == true
        {
            subskill4 = "Audio Conferencing"
            maintenancecounter = maintenancecounter+1

        }
        if videoconfe.isChecked == false
        {
            subskill1 = ""
        }
        if noc.isChecked == false
        {
            subskill2 = ""
        }
        if audi2.isChecked == false
        {
            subskill3 = ""
        }
        if audiconfe.isChecked == false
        {
            subskill4 = ""
        }
        if maintenancecounter == 2
        {
            if name.text == "" || contact.text == "" || email.text == ""
            {
                myalert("Error", "One of the text field is empty.")
                name.text=""
                email.text=""
                contact.text=""
                
                videoconfe.isChecked = false
                noc.isChecked = false
                audiconfe.isChecked = false
                audi2.isChecked = false
                maintenancecounter = 0
                
                
                
            }
            else {
                
                let name1:String = name.text!
                let email1:String = email.text!
                let contact1:String = contact.text!
                self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                     myalert("Sucess", "Skills Entered Sucessfully")
                
                
                videoconfe.isChecked = false
                noc.isChecked = false
                audiconfe.isChecked = false
                audi2.isChecked = false
                maintenancecounter = 0
            }
            
        }
        else
        {
            myalert("Error", "Please Select any 2")
            name.text=""
            email.text=""
            contact.text=""
            
            videoconfe.isChecked = false
            noc.isChecked = false
            audiconfe.isChecked = false
            audi2.isChecked = false
            maintenancecounter = 0
            
            
        }
      
        }
    
    
    
    @IBOutlet weak var route: UISegmentedControl!
    
    func routing1()
    {
        if route.selectedSegmentIndex == 1
        {
            subskill1 = "Employed"
        }
        if route.selectedSegmentIndex == 2
        {
            subskill1 = "On-Contact"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            
            
            
        }
        else {
            
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                  myalert("Sucess", "Skills Entered Sucessfully")
            
        }
        
        
       
    }
   
    @IBOutlet weak var telephonic: Checkbox!
    @IBOutlet weak var online: Checkbox!
    @IBOutlet weak var onsite: Checkbox!
    
    func troubleshooting1()
    {
        if online.isChecked == true
        {
            subskill1 = "Online"
        }
        if onsite.isChecked == true
        {
            subskill2 = "Onsite"
        }
        if telephonic.isChecked == true
        {
            subskill3 = "Telephonic"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            online.isChecked = false
            onsite.isChecked = false
            telephonic.isChecked = false
            }
         else
          {
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skills").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                   myalert("Sucess", "Skills Entered Sucessfully")
          
            
            online.isChecked = false
            onsite.isChecked = false
            telephonic.isChecked = false
        }
    }
    
    @IBOutlet weak var projectmgmt: UISegmentedControl!
    
    func project1()
    {
        if projectmgmt.selectedSegmentIndex == 1
        {
            subskill1 = "Government"
        }
        if projectmgmt.selectedSegmentIndex == 2
        {
            subskill1 = "Corporate"
        }
        if projectmgmt.selectedSegmentIndex == 3
        {
            subskill1 = "Construction"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            
            
        }
        else
        {
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                 myalert("Sucess", "Skills Entered Sucessfully")
          
        }
        
    }
   
   
    @IBOutlet weak var SoW: Checkbox!
    @IBOutlet weak var tender: Checkbox!
    @IBOutlet weak var functionality: Checkbox!
    @IBOutlet weak var proposal: Checkbox!
    @IBOutlet weak var reportwriting: Checkbox!
    
    
    func documentation1()
    {
        if reportwriting.isChecked == true
        {
            subskill1 = "Report Writing"
        }
        if proposal.isChecked == true
        {
            subskill2 = "Proposal"
        }
        if functionality.isChecked == true
        {
            subskill3 = "Functionality"
        }
        if tender.isChecked == true
        {
            subskill4 = "Tender"
        }
        if SoW.isChecked == true
        {
            subskill5  = "SoW"
        }
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the text field is empty.")
            name.text=""
            email.text=""
            contact.text=""
            reportwriting.isChecked = false
            proposal.isChecked = false
            functionality.isChecked = false
            tender.isChecked = false
            SoW.isChecked = false
            
            
        }
        else
        {
            let name1:String = name.text!
            let email1:String = email.text!
            let contact1:String = contact.text!
            self.ref.child(name1).child("Skill").setValue(["Name of the Person":name1,"Email":email1,"Contact":contact1,"Skill":Skill,"SubSkill1 ":subskill1,"SubSkill2":subskill2,"SubSkill3":subskill3,"SubSkill4":subskill4,"SubSkill5":subskill5,"SubSkill6":subskill6,"SubSkill7":subskill7,"SubSkill8":subskill8])
                  myalert("Sucess", "Skills Entered Sucessfully")
            
            reportwriting.isChecked = false
            proposal.isChecked = false
            functionality.isChecked = false
            tender.isChecked = false
            SoW.isChecked = false
            
        }
        
       
    }
    
    @IBAction func nxtbtn(_ sender: UIButton) {
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "Please Enter valid data")
            myalert("Error", "Please Enter Skill")
            
            
        }
        if choice == 1
        {
           
        installatinon1()
           
        }
        if choice == 2
        {
         fabrication1()
        }
        if choice == 3
        {
         programing1()
        }
        if choice == 4
        {
         avdesigning1()
        }
        if choice == 5
        {
         interiordraught()
        }
        if choice == 6
        {
         electrician1()
        }
        if choice == 7
        {
         maintenance1()
        }
        if choice == 8
        {
         routing1()
        }
        if choice == 9
        {
         troubleshooting1()
        }
        if choice == 10
        {
         project1()
        }
        if choice == 11
        {
        documentation1()
        }
      
    }
   
    @IBAction func next(_ sender: Any) {
        if name.text == "" || contact.text == "" || email.text == ""
        {
            myalert("Error", "One of the field is empty")
        }
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SkillsViewController") as! SkillsViewController
        vc.id1 = name.text!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }
    
}
