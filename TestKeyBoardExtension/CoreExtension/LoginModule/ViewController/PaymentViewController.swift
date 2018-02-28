//
//  PaymentViewController.swift
//  TestKeyBoardExtension
//
//  Created by RahulKumar on 28/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class PaymentViewController: UIInputViewController {

    var name:String = ""
    @IBOutlet weak var lblTo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTo.text = "To \(name)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLogout(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: false)
    }
    @IBAction func actionChange(_ sender: UIButton) {
        
        self.advanceToNextInputMode()
    }
    
    @IBAction func actionHome(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: false)
    }


}
