//
//  TestProjectViewController.swift
//
//  Created by RahulKumar on 28/02/18.
//

import UIKit

class TestProjectViewController: CoreBaseViewController{

 
    var viewModel:TestProjectViewModel?{
        
        didSet{
            
            viewModel?.status.bindAndFire {
                
                print($0)
            }
            
            viewModel?.data.bindAndFire{
                
                print($0.contacts.count)
            }
            
            viewModel?.message.bindAndFire {
                [unowned self] in
                if $0 != ""{
                    
                    self.showFailedMessage($0)
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonActionSave(_ sender: UIButton) {
        
    }
    
    func setupUI(){
        
        viewModel = TestProjectViewModel.init()
       // UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.none)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.setNavigationHeader(titleString: kTextNavigationBarChangePassword, barColor: kColorNavigationBar)
//        self.setNavigationBarLeftButton(imageName: "close", popFlag: false)
        
    }
    
    override func leftButtonDismissAction(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1;
            
        let nextResponder = textField.superview?.viewWithTag(nextTag)
        if (nextResponder != nil){
                
            nextResponder?.becomeFirstResponder()
        }
        else{
                
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showFailedMessage(_ message:String){
        
        let alert = UIAlertController(title: "Error!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
}
