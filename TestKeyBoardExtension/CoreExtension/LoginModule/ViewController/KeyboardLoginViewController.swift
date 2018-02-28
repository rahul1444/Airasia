//
//  KeyboardLoginViewController.swift
//  TestKeyBoardExtension
//
//  Created by RahulKumar on 28/02/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class KeyboardLoginViewController: UIInputViewController,UITextFieldDelegate {
    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var capFlag : Bool = false
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfLogin.delegate = self
        tfPassword.delegate = self
        
         self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let buttonTitles1 = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
        let buttonTitles2 = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
        let buttonTitles3 = ["CP", "Z", "X", "C", "V", "B", "N", "M", "BP"]
        let buttonTitles4 = ["CHG", "SPACE", "RETURN"]
        let buttonTitles5 = ["LOGIN"]
        
        let row1 = createRowOfButtons(buttonTitles: buttonTitles1 as [NSString])
        let row2 = createRowOfButtons(buttonTitles: buttonTitles2 as [NSString])
        let row3 = createRowOfButtons(buttonTitles: buttonTitles3 as [NSString])
        let row4 = createRowOfButtons(buttonTitles: buttonTitles4 as [NSString])
        let row5 = createRowOfButtons(buttonTitles: buttonTitles5 as [NSString])
        
        let screenSize: CGRect = UIScreen.main.bounds
        let myView = UIView(frame: CGRect(x: 0, y: self.tfLogin.frame.size.height + 3, width: screenSize.width, height: 200))
        self.view.addSubview(myView)
        
        myView.addSubview(row1)
        myView.addSubview(row2)
        myView.addSubview(row3)
        myView.addSubview(row4)
        myView.addSubview(row5)
        
        row1.translatesAutoresizingMaskIntoConstraints = false
        row2.translatesAutoresizingMaskIntoConstraints = false
        row3.translatesAutoresizingMaskIntoConstraints = false
        row4.translatesAutoresizingMaskIntoConstraints = false
        row5.translatesAutoresizingMaskIntoConstraints = false
        
        
        addConstraintsToInputView(inputView: myView, rowViews: [row1, row2, row3, row4,row5])
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func addConstraintsToInputView(inputView: UIView, rowViews: [UIView]){
        
        for (index,rowView) in rowViews.enumerated(){
            let rightSideConstraint = NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: inputView, attribute: .right, multiplier: 1.0, constant: -1)
            
            let leftConstraint = NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: inputView, attribute: .left, multiplier: 1.0, constant: 1)
            
            inputView.addConstraints([leftConstraint, rightSideConstraint])
            
            var topConstraint: NSLayoutConstraint
            
            if index == 0 {
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: inputView, attribute: .top, multiplier: 1.0, constant: 0)
                
            }else{
                
                let prevRow = rowViews[index-1]
                topConstraint = NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: prevRow, attribute: .bottom, multiplier: 1.0, constant: 0)
                
                let firstRow = rowViews[0]
                let heightConstraint = NSLayoutConstraint(item: firstRow, attribute: .height, relatedBy: .equal, toItem: rowView, attribute: .height, multiplier: 1.0, constant: 0)
                
                inputView.addConstraint(heightConstraint)
            }
            inputView.addConstraint(topConstraint)
            
            var bottomConstraint: NSLayoutConstraint
            
            
            if index == rowViews.count - 1 {
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: inputView, attribute: .bottom, multiplier: 1.0, constant: 0)
                
            }else{
                
                let nextRow = rowViews[index+1]
                bottomConstraint = NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: nextRow, attribute: .top, multiplier: 1.0, constant: 0)
            }
            
            inputView.addConstraint(bottomConstraint)
        }
        
    }
    
    
    func createRowOfButtons(buttonTitles: [NSString]) -> UIView {
    
    var buttons = [UIButton]()
        
        let keyboardRowView = UIView(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:30))
    
    for buttonTitle in buttonTitles{
    
        let button = createButtonWithTitle(title: buttonTitle as String)
    buttons.append(button)
    keyboardRowView.addSubview(button)
    }
    addIndividualButtonConstraints(buttons: buttons, mainView: keyboardRowView)
    
    return keyboardRowView
    }
    
    func createButtonWithTitle(title: String) -> UIButton {
    
        let button = UIButton(type: .system) as UIButton
        button.frame = CGRect(x:0, y:0, width:20, height:20)
        button.setTitle(title, for: .normal)
    button.sizeToFit()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGray, for: .normal)
    
        button.addTarget(self, action: #selector(actionWithParam(sender:)), for: .touchUpInside)
    
    return button
    }
    
    
    func addIndividualButtonConstraints(buttons: [UIButton], mainView: UIView){
        
        for (index, button) in buttons.enumerated() {
            
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: mainView, attribute: .top, multiplier: 1.0, constant: 1)
            
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: mainView, attribute: .bottom, multiplier: 1.0, constant: -1)
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: mainView, attribute: .right, multiplier: 1.0, constant: -1)
                
            }else{
                
                let nextButton = buttons[index+1]
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: nextButton, attribute: .left, multiplier: 1.0, constant: -1)
            }
            
            
            var leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: mainView, attribute: .left, multiplier: 1.0, constant: 1)
                
            }else{
                
                let prevtButton = buttons[index-1]
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: prevtButton, attribute: .right, multiplier: 1.0, constant: 1)
                
                let firstButton = buttons[0]
                let widthConstraint = NSLayoutConstraint(item: firstButton, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                
                mainView.addConstraint(widthConstraint)
            }
            
            mainView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }

    @objc func actionWithParam(sender: UIButton){
       
        let button = sender
        let title = button.title(for: .normal)
        switch title! {
        case "CP","BP","RETURN":
            if (capFlag){
                capFlag = false
            }
            else{
                capFlag = true
            }
        case "SPACE":
            if (tfLogin.isSelected){
                tfLogin.text = "\(tfLogin.text!) "
            }
            else{
                tfPassword.text = "\(tfPassword.text!) "
            }
        case "CHG":
            self.advanceToNextInputMode()
            
        case "LOGIN":
            print("login")
            let viewController:UIViewController = UIStoryboard(name: "KeyboardLogin", bundle: nil).instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            if (tfLogin.isFocused){
                tfLogin.text = "\(tfLogin.text!)\(title!)"
            }
            else{
                 tfPassword.text = "\(tfPassword.text!)\(title!)"
            }
            print("default")
        }

    }

    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        //self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    @IBAction func actionLogin(_ sender: UIButton) {
    }
    
}
