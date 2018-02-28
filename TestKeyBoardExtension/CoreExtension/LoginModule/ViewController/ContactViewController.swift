//
//  ContactViewController.swift
//  TestKeyBoardExtension
//
//  Created by RahulKumar on 28/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ContactViewController: UIInputViewController,UITableViewDelegate,UITableViewDataSource {
    
    let name = ["Rahul","Kumar","Raj","Vinod","Aman"]
    let number = ["23897423487","2398478923","2398478934","23084787634","23874687634"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTable", for: indexPath) as! ContactTableViewCell
        cell.userName.text = name[indexPath.row]
        cell.userNumber.text = number[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController:PaymentViewController = UIStoryboard(name: "KeyboardLogin", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        viewController.name = name[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        self.navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: false)
    }
}
