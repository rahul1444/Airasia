//
//  CoreBaseViewController.swift
//
//  Created by RahulKumar on 28/02/18.
//

import UIKit

class CoreBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationHeader(titleString:String,barColor:String){
        
        self.navigationItem.title = titleString
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: barColor)
    }
    
    func setNavigationBarRightButton(imageName:String){
        
        var image = UIImage(named: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(rightButtonAction))
    }
    
    func setNavigationBarLeftButton(imageName:String,popFlag:Bool){
        
        var image = UIImage(named: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        if (popFlag){
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(leftButtonAction))
        }
        else{
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(leftButtonDismissAction))
        }
        
    }
    
    @objc func rightButtonAction(){
        
    }
    
    @objc func leftButtonAction(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func leftButtonDismissAction(){
        
        self.dismiss(animated: true, completion: nil)
    }
    


}

extension UIColor {
    
    convenience init(hexString: String,alphaHex:Float = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
