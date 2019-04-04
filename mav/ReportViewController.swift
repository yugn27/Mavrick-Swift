//
//  ReportViewController.swift
///  MavRick
//
//  Created by Yash Nayak on 21/11/18.
//  Copyright © 2018 inspire. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import UICheckbox_Swift

class ReportViewController: UIViewController {
    
    //text fields
    @IBOutlet weak var SiteName: UITextField!
    @IBOutlet weak var VisitedBy: UITextField!
    
    //date and time picker
    @IBOutlet weak var Dateoutlet: UIDatePicker!
    @IBOutlet weak var TimeInoutlet: UIDatePicker!
    @IBOutlet weak var Timeoutoutlet: UIDatePicker!
    
    // check box outlet
    //purpose of visit
    @IBOutlet weak var InpectionTestingoutlet: Checkbox!
    @IBOutlet weak var previsit: Checkbox!
    @IBOutlet weak var termination: Checkbox!
    @IBOutlet weak var installationoutlet: Checkbox!
    @IBOutlet weak var replacementandreinstall: Checkbox!
    @IBOutlet weak var cabling: Checkbox!
    @IBOutlet weak var rackbuilding: Checkbox!
    @IBOutlet weak var testingandqc: Checkbox!

    // reason for non completion
    @IBOutlet weak var sitenotready: Checkbox!
    @IBOutlet weak var hvacnotfunctional: Checkbox!
    @IBOutlet weak var faultyequipment: Checkbox!
    @IBOutlet weak var stpandcableissue: Checkbox!
    @IBOutlet weak var dustycondition: Checkbox!
    @IBOutlet weak var upssupply: Checkbox!
    @IBOutlet weak var powersequence: Checkbox!
    @IBOutlet weak var equipmentmissing: Checkbox!
    //other
    @IBOutlet weak var otherreasonfornoncompletion: Checkbox!
    @IBOutlet weak var othertextfield: UITextField!
    
    //person met
    @IBOutlet weak var personmetoutlettext: UITextField!
    
    // contact text field
    @IBOutlet weak var contactoutlettextfield: UITextField!
    
    //Project Incharge
    @IBOutlet weak var projectinchage: Checkbox!
    @IBOutlet weak var projectco: Checkbox!
    @IBOutlet weak var maincontractor: Checkbox!
    @IBOutlet weak var siteenginner: Checkbox!
    @IBOutlet weak var temporaryincharge: Checkbox!
    // other
    @IBOutlet weak var otherprojectincharge: Checkbox!
    @IBOutlet weak var otherprojectincharge23: UITextField!
    
    //last remarks
    @IBOutlet weak var remarkslast: UITextField!
    
    
    // Database  reference firebase
    var ref : DatabaseReference!
    
    
    //purpose of visit
    var InpectionTestingvar = "No"
    var previsitvar = "No"
    var terminationvar = "No"
    var installationoutletvar = "No"
    var replacementandreinstallvar = "No"
    var cablingvar = "No"
    var rackbuildingvar = "No"
    var testingandqcvar = "No"
    
    
    // reason for non completion
    var sitenotreadyvar = "No"
    var hvacnotfunctionalvar = "No"
    var faultyequipmentvar = "No"
    var stpandcableissuevar = "No"
    var dustyconditionvar = "No"
    var upssupplyvar = "No"
    var powersequencevar = "No"
    var equipmentmissingvar = "No"
    var otherreasonfornoncompletionvar = "No"
    
    //Project Incharge
    var projectinchagevar = "No"
    var projectcovar = "No"
    var maincontractorvar = "No"
    var siteenginnervar = "No"
    var temporaryinchargevar = "No"
    //var otherprojectinchargevar = "No"
    
    
    @IBAction func Menu(_ sender: UIButton) {
    }
   
    override func viewDidLoad() {
      
        super.viewDidLoad()
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        //FirebaseApp.configure()
        ref =  Database.database().reference()
        
        
        
         self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        //other text field
        //othertextfield.isUserInteractionEnabled = false
        //otherprojectincharge23.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func SubmitReportBtn(_ sender: UIButton) {

        
        if SiteName.text?.isEmpty ?? true || VisitedBy.text?.isEmpty ?? true || personmetoutlettext.text?.isEmpty ?? true || contactoutlettextfield.text?.isEmpty ?? true || remarkslast.text?.isEmpty ?? true
        {
            myalert("Empty Field", "Fill in the empty field")
        }
        else{
                //purpose of visit
                if (InpectionTestingoutlet.isChecked == false && previsit.isChecked == false && termination.isChecked == false && installationoutlet.isChecked == false && replacementandreinstall.isChecked == false && cabling.isChecked == false && rackbuilding.isChecked == false && testingandqc.isChecked == false)
                {
                    myalert("Purpose of visit", "Select atleast one item")
                }
                else{
                    //let DDrawingstr = String(DDrawing)
                    
                    //purpose of visit
                    if (InpectionTestingoutlet.isChecked == true)
                    {
                        InpectionTestingvar = "Yes";
                    }
                    else{
                        InpectionTestingvar = "No";
                    }
                    
                    if (previsit.isChecked == true)
                    {
                        previsitvar = "Yes";
                    }
                    else{
                        previsitvar = "No";
                    }
                    
                    if (termination.isChecked == true)
                    {
                        terminationvar = "Yes";
                    }
                    else{
                        terminationvar = "No";
                    }
                    
                    
                    if (installationoutlet.isChecked == true)
                    {
                        installationoutletvar = "Yes";
                    }
                    else{
                        installationoutletvar = "No";
                    }
                    
                    if (replacementandreinstall.isChecked == true)
                    {
                        replacementandreinstallvar = "Yes";
                    }
                    else{
                        replacementandreinstallvar = "No";
                    }
                    
                    
                    if (cabling.isChecked == true)
                    {
                        cablingvar = "Yes";
                    }
                    else{
                        cablingvar = "No";
                    }
                    
                    
                    
                    if (rackbuilding.isChecked == true)
                    {
                        rackbuildingvar = "Yes";
                    }
                    else{
                        rackbuildingvar = "No";
                    }
                    
                    
                    if (testingandqc.isChecked == true)
                    {
                        testingandqcvar = "Yes";
                    }
                    else{
                        testingandqcvar = "No";
                    }
                    
                    
                    //Reason for non completion
                    if (sitenotready.isChecked == true)
                    {
                        sitenotreadyvar = "Yes";
                    }
                    else{
                        sitenotreadyvar = "No";
                    }
                    
                    if (hvacnotfunctional.isChecked == true)
                    {
                        hvacnotfunctionalvar = "Yes";
                    }
                    else{
                        hvacnotfunctionalvar = "No";
                    }
                    
                    if (faultyequipment.isChecked == true)
                    {
                        faultyequipmentvar = "Yes";
                    }
                    else{
                        faultyequipmentvar = "No";
                    }
                    
                    if (stpandcableissue.isChecked == true)
                    {
                        stpandcableissuevar = "Yes";
                    }
                    else{
                        stpandcableissuevar = "No";
                    }
                    
                    if (dustycondition.isChecked == true)
                    {
                        dustyconditionvar = "Yes";
                    }
                    else{
                        dustyconditionvar = "No";
                    }
                    
                    if (upssupply.isChecked == true)
                    {
                        upssupplyvar = "Yes";
                    }
                    else{
                        upssupplyvar = "No";
                    }
                    
                    if (powersequence.isChecked == true)
                    {
                        powersequencevar = "Yes";
                    }
                    else{
                        powersequencevar = "No";
                    }
                    
                    if (equipmentmissing.isChecked == true)
                    {
                        equipmentmissingvar = "Yes";
                    }
                    else{
                        equipmentmissingvar = "No";
                    }
                    
                   /*if (otherreasonfornoncompletion.isChecked == true)
                    {
                        othertextfield.isUserInteractionEnabled = true
                        if othertextfield.text?.isEmpty ?? true
                        {
                            myalert("Other Reason", "Fill in the empty field")
                        }
                    }
 
                    */
                
                    //Project Incharge
                    if (projectinchage.isChecked == true)
                    {
                        projectinchagevar = "Yes";
                    }
                    else{
                        projectinchagevar = "No";
                    }
                    
                    
                    if (projectco.isChecked == true)
                    {
                        projectcovar = "Yes";
                    }
                    else{
                        projectcovar = "No";
                    }
                    
                    
                    if (maincontractor.isChecked == true)
                    {
                        maincontractorvar = "Yes";
                    }
                    else{
                        maincontractorvar = "No";
                    }
                    
                    
                    if (siteenginner.isChecked == true)
                    {
                        siteenginnervar = "Yes";
                    }
                    else{
                        siteenginnervar = "No";
                    }
                    
                    if (temporaryincharge.isChecked == true)
                    {
                        temporaryinchargevar = "Yes";
                    }
                    else{
                        temporaryinchargevar = "No";
                    }
                    
                    if (otherprojectincharge.isChecked == true || otherreasonfornoncompletion.isChecked == true)
                    {
                        //otherprojectincharge23.isUserInteractionEnabled = true
                        if otherprojectincharge23.text?.isEmpty ?? true && othertextfield.text?.isEmpty ?? true
                        {
                            myalert("Other", "Fill in the empty field")
                        }
                       
                       
                    }
            
                    //datebase storing
                    self.ref.child(SiteName.text!).child("Site Visit Report").setValue(["Site Name":SiteName.text,"Visited By":VisitedBy.text,"Person Met":personmetoutlettext.text,"Contact":contactoutlettextfield.text,"Remarks":remarkslast.text,"Reason for non completion Other":othertextfield.text,"Project Incharge Other":otherprojectincharge23.text])
                    
                    self.ref.child(SiteName.text!).child("Date and Time").setValue(["Date":"\(Dateoutlet.date)","TimeIn":"\(TimeInoutlet.date)" ,"Timeout": "\(Timeoutoutlet.date)"])
                    
                    //purpose of visit
                    self.ref.child(SiteName.text!).child("Purpose Of Visit").setValue(["Inpection and Testing":InpectionTestingvar,"Pre Visit":previsitvar,"Termination":terminationvar,"Installation":installationoutletvar,"Replacement and reinstallation":replacementandreinstallvar,"Cabling":cablingvar,"Rack building":rackbuildingvar,"Testing and Qc":testingandqcvar])
                    
                    //Reason for non completion
                    self.ref.child(SiteName.text!).child("Reason for non completion").setValue(["Site not ready":sitenotreadyvar,"HVAC not functional":hvacnotfunctionalvar,"Faulty equipment":faultyequipmentvar,"STP and cable issue":stpandcableissuevar,"Dusty condition":dustyconditionvar,"UPS supply for AV":upssupplyvar,"Power sequence":powersequencevar,"Equipment missing":equipmentmissingvar])
                    
                    // Project Incharge
                    self.ref.child(SiteName.text!).child("Project Incharge").setValue(["Project Incharge":projectinchagevar,"Project Co-Ordinator":projectcovar,"Main Contractor":maincontractorvar,"Site Engineer":siteenginnervar,"Temporary In-Charge":temporaryinchargevar])
                    
                    // final print
                    print("Report Submit Sucessfully")
                    //myalert("Sucesss", "Quote Sucessfully")
                    //clear()
                }
        }
   }
    
    func clear(){
        SiteName.text = ""
        VisitedBy.text = ""
        personmetoutlettext.text = ""
        contactoutlettextfield.text = ""
        remarkslast.text = ""
        othertextfield.text = ""
        otherprojectincharge23.text = ""
    }
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }

}
