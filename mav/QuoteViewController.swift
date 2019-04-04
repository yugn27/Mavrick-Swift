//
//  QuoteViewController.swift
//  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class QuoteViewController: UIViewController {

    @IBOutlet weak var Projectname: UITextField!
    @IBOutlet weak var NoDisplays: UITextField!
    @IBOutlet weak var NoSpeakers: UITextField!
    @IBOutlet weak var NoPAX: UITextField!
    
    @IBOutlet weak var RoomSelectoutlet: UISegmentedControl!
    @IBOutlet weak var VideoConferenceoutlet: UISegmentedControl!
    @IBOutlet weak var ControlSystemoutlet: UISegmentedControl!
    @IBOutlet weak var SLDoutlet: UISegmentedControl!
    @IBOutlet weak var DDrawingoutlet: UISegmentedControl!
    @IBOutlet weak var termsandcondcbox: Checkbox!
    
    
    //term and cond
    @IBOutlet weak var termandcondshow: UIView!
    
    
// Database  reference firebase
    var ref : DatabaseReference!
    

    let VCvar = 15000
    let Controlvar = 25000
    var displaycostvar = 0
    var speakercostvar = 0
    var packcostvar = 0
    var SLDprice_3d = 0.0
    var Cost = 0.0
    var Total = 0.0

    // Room type Selector
    var RoomType = "Conference"

    @IBAction func RoomtypeSeg(_ sender: UISegmentedControl) {
        switch RoomSelectoutlet.selectedSegmentIndex
        {
        case 0:
            RoomType = "Conference";
        case 1:
            RoomType = "Meeting";
        case 2:
            RoomType = "Training";
        case 3:
            RoomType = "Auditorium";
        default:
            break;
        }
    }
    
    // Video Conference
    var VideoConference = "Yes"
    
    @IBAction func VideoConferenceSeg(_ sender: UISegmentedControl) {
        switch VideoConferenceoutlet.selectedSegmentIndex
        {
        case 0:
            VideoConference = "Yes";
        case 1:
            VideoConference = "No";
        default:
            break;
        }
    }
    
    // Control System
    var ControlSystem = "Yes"
    
    @IBAction func ControlSystemSeg(_ sender: UISegmentedControl) {
        switch ControlSystemoutlet.selectedSegmentIndex
        {
        case 0:
            ControlSystem = "Yes";
        case 1:
            ControlSystem = "No";
        default:
            break;
        }
    }
    
    // SLD
    var SLD = "Yes"
    
    @IBAction func SLDSeg(_ sender: UISegmentedControl) {
        switch SLDoutlet.selectedSegmentIndex
        {
        case 0:
            SLD = "Yes";
        case 1:
            SLD = "No";
        default:
            break;
        }
    }
    
    // 3D Drawing
    var DDrawing = "Yes"
    
    @IBAction func DDrawingSeg(_ sender: UISegmentedControl) {
        switch DDrawingoutlet.selectedSegmentIndex
        {
        case 0:
            DDrawing = "Yes";
        case 1:
            DDrawing = "No";
        default:
            break;
        }
    }
    
    @IBAction func Back(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        //FirebaseApp.configure()
        ref =  Database.database().reference()
        
        
        termandcondshow.isHidden = true
        
        
         self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        //let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVCIn") as! TertiaryViewController
        //myVC.stringPassed = "Yash"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitReg2(_ sender: UIButton) {
    
        //let DDrawingstr = String(DDrawing)
        
        
        
        if Projectname.text?.isEmpty ?? true || NoDisplays.text?.isEmpty ?? true || NoSpeakers.text?.isEmpty ?? true || NoPAX.text?.isEmpty ?? true
        {
            myalert("Empty Field", "Fill in the empty field")
        }
        else{
            if (termsandcondcbox.isChecked == true)
            {
                //total func code
                let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVCIn") as! TertiaryViewController
                vc.Projectnamepass = Projectname.text!
                vc.NoDisplayspass = NoDisplays.text!
                vc.NoSpeakerspass = NoSpeakers.text!
                vc.NoPAXpass = NoPAX.text!
                vc.RoomSelectoutletpass = "\(String(describing: RoomType))"
                vc.VideoConferenceoutletpass = "\(String(describing: VideoConference))"
                vc.ControlSystemoutletpass = "\(String(describing: ControlSystem))"
                vc.SLDoutletpass = "\(String(describing: SLD))"
                vc.DDrawingoutletpass = "\(String(describing: DDrawing))"
                print(RoomType)
                
                if  (RoomType == "Conference")
                {
                    let NoDisplayint:Int? = Int(NoDisplays.text!)
                    displaycostvar = ((NoDisplayint!)*(5000))
                    
                    let NoSpeakersint:Int? = Int(NoSpeakers.text!)
                    speakercostvar = ((NoSpeakersint!)*(2000))
                    
                    let NoPAXint:Int? = Int(NoPAX.text!)
                    packcostvar = ((NoPAXint!)*(100))
                    
                    if (VideoConference == "Yes" && ControlSystem == "Yes")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                        
                    }
                    else if(VideoConference == "Yes" && ControlSystem == "No")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                        
                    else if(VideoConference == "No" && ControlSystem == "Yes")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                    else if(VideoConference == "No" && ControlSystem == "No")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                    print(Total)
                    //let b:Int? = secondText.text.toInt() // secondText is UITextField
                }
                
                
                if  (RoomType == "Meeting")
                {
                    print("Done")
                    print(RoomType)
                    let NoDisplayint:Int? = Int(NoDisplays.text!)
                    displaycostvar = ((NoDisplayint!)*(5000))
                    //print(displaycostvar)
                    
                    let NoSpeakersint:Int? = Int(NoSpeakers.text!)
                    speakercostvar = ((NoSpeakersint!)*(2000))
                    //print(speakercostvar)
                    
                    let NoPAXint:Int? = Int(NoPAX.text!)
                    packcostvar = ((NoPAXint!)*(100))
                    //print(packcostvar)
                    
                    if (VideoConference == "Yes" && ControlSystem == "Yes")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar + Controlvar)
                        print(Cost)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        print(Total)
                        
                        
                    }
                    else if(VideoConference == "Yes" && ControlSystem == "No")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                        
                    else if(VideoConference == "No" && ControlSystem == "Yes")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                    else if(VideoConference == "No" && ControlSystem == "No")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                    print(Total)
                    //let b:Int? = secondText.text.toInt() // secondText is UITextField
                }
                    
                    //tranning
                else if  (RoomType == "Training")
                {
                    let NoDisplayint:Int? = Int(NoDisplays.text!)
                    displaycostvar = ((NoDisplayint!)*(8000))
                    
                    let NoSpeakersint:Int? = Int(NoSpeakers.text!)
                    speakercostvar = ((NoSpeakersint!)*(2000))
                    
                    let NoPAXint:Int? = Int(NoPAX.text!)
                    packcostvar = ((NoPAXint!)*(100))
                    
                    if (VideoConference == "Yes" && ControlSystem == "Yes")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                        
                    }
                    else if(VideoConference == "Yes" && ControlSystem == "No")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                        
                    else if(VideoConference == "No" && ControlSystem == "Yes")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                    else if(VideoConference == "No" && ControlSystem == "No")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                    print(Total)
                    //let b:Int? = secondText.text.toInt() // secondText is UITextField
                }
                    
                    //Audi
                else if  (RoomType == "Auditorium")
                {
                    let NoDisplayint:Int? = Int(NoDisplays.text!)
                    displaycostvar = ((NoDisplayint!)*(10000))
                    
                    let NoSpeakersint:Int? = Int(NoSpeakers.text!)
                    speakercostvar = ((NoSpeakersint!)*(3000))
                    
                    let NoPAXint:Int? = Int(NoPAX.text!)
                    packcostvar = ((NoPAXint!)*(50))
                    
                    if (VideoConference == "Yes" && ControlSystem == "Yes")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                        
                    }
                    else if(VideoConference == "Yes" && ControlSystem == "No")
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + VCvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                        
                    else if(VideoConference == "No" && ControlSystem == "Yes")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar + Controlvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                        
                    else if(VideoConference == "No" && ControlSystem == "No")
                        
                    {
                        Cost = Double(displaycostvar + speakercostvar + packcostvar)
                        
                        if (SLD == "Yes"  && DDrawing == "Yes")
                        {
                            SLDprice_3d = ((Cost * 0.05) + (Cost * 0.1)) * 1.2
                            
                        }
                        else if(SLD == "Yes" && DDrawing == "No")
                        {
                            SLDprice_3d = (Cost * 0.05) * 1.2
                        }
                            
                            
                            
                        else if(SLD == "No" && DDrawing == "Yes")
                        {
                            SLDprice_3d = (Cost * 0.1) * 1.2
                        }
                            
                        else
                        {
                            SLDprice_3d = 0
                            
                        }
                        Total = SLDprice_3d + Cost
                        
                    }
                    print(Total)
                    //let b:Int? = secondText.text.toInt() // secondText is UITextField
                }
                
                //total finc code end
                
                
                vc.TotalFinalpass = "\(String(describing: Total))"
                
                
                
                
                
                
                self.ref.child(Projectname.text!).child("Info").setValue(["Project Name":Projectname.text,"Number of Display":NoDisplays.text,"Number of Speaker":NoSpeakers.text,"Number of PAX":NoPAX.text])
                
                self.ref.child(Projectname.text!).child("Checkbox").setValue(["Room Type":RoomType,"Video Conference":VideoConference,"Control System":ControlSystem,"SDL":SLD,"3D Drawing":DDrawing,"Total Cost":Total])
                
                
                //invoiceprojectout.placeholder = "umnag"
                //numberofdisplayout.placeholder = "\(String(describing: Projectname.text))"
                //noofspeaker.placeholder = NoSpeakers.text
                //noofpaxsecdoutlet.placeholder = NoPAX.text
                
                
               
                
              /*  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    
                    let vc = segue.destination  as! TertiaryViewController // Get our ColourView
                    print(segue.identifier) // Show the segue identifier that is being run
                    
                    vc.Projectnamepass = Projectname.text!
                    vc.NoDisplayspass = NoDisplays.text!
                    vc.NoSpeakerspass = NoSpeakers.text!
                    vc.NoPAXpass = NoPAX.text!
                    vc.RoomSelectoutletpass = "\(String(describing: RoomSelectoutlet))"
                    vc.VideoConferenceoutletpass = "\(String(describing: VideoConference))"
                    vc.ControlSystemoutletpass = "\(String(describing: ControlSystemoutlet))"
                    vc.SLDoutletpass = "\(String(describing: SLDoutlet))"
                    vc.DDrawingoutletpass = "\(String(describing: DDrawingoutlet))"
                    
                */
                    
                
                
                
                
                
                
                //suge
                navigationController?.pushViewController(vc, animated: true)
                    
                
                
                
            
            
                //print("Sucessfully")
                //myalert("Sucesss", "Quote Sucessfully")
            
                
                //clear()
                
                
                
              //  let segueIdentifier: String
               // segueIdentifier = "invoice2"
               // self.performSegue(withIdentifier: segueIdentifier, sender: self)
            }
            else{
               myalert("Terms & Condtion", "Please accept the Terms & Condtion")
            }
        }
    }
    
    
    @IBAction func testbuttonmdff(_ sender: Any) {
        //let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVCIn") as! TertiaryViewController
        //myVC.Projectnamepass = Projectname.text!
        
       
        
        
        // self.ref.child(Projectname.text!).child("Checkbox").setValue(["Room Type":RoomType,"Video Conference":VideoConference,"Control System":ControlSystem,"SDL":SLD,"3D Drawing":DDrawing])
        
    
        //let vc = segue.destination  as! TertiaryViewController // Get our ColourView
        //print(segue.identifier) // Show the segue identifier that is being run
    }
    
    func clear(){
        //nametestoutletdelete.text = "Test"
        Projectname.text = ""
           NoDisplays.text = ""
           NoSpeakers.text = ""
           NoPAX.text = ""
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }

    @IBAction func termandcond(_ sender: Any) {
        //let segueIdentifier: String
        //segueIdentifier = "Termancondwe2"
        //self.performSegue(withIdentifier: segueIdentifier, sender: self)
        termandcondshow.isHidden = false
    }
    
    
    @IBAction func termclosebtn(_ sender: Any) {
        termandcondshow.isHidden = true
    }
    
}
