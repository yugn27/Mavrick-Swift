//
//  File.swift
//  mav
//
//  Created by INSPIRE on 19/06/17.
//  Copyright © 2017 inspire. All rights reserved.
//

import Foundation
import UIKit

class file: UIViewController {
    
    @IBOutlet weak var open: UIBarButtonItem!
    @IBOutlet weak var mavrick: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
