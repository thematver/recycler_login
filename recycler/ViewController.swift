//
//  ViewController.swift
//  recycler
//
//  Created by Матвей Корепанов on 09.09.2020.
//  Copyright © 2020 Матвей Корепанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var MainView: UIView!
    func changeBorderColor(color:CGColor) {
        let bottomPasswordLine = CALayer()
             bottomPasswordLine.frame = CGRect(x: -50.0, y: passwordTextField.frame.height + 10, width: passwordTextField.frame.width+50, height: 1.0)
             bottomPasswordLine.backgroundColor = color
             let bottomEmailLine = CALayer()
             bottomEmailLine.frame = CGRect(x: -50.0, y: emailTextField.frame.height + 10, width: emailTextField.frame.width+50, height: 1.0)
             bottomEmailLine.backgroundColor = color
             emailTextField.borderStyle = UITextField.BorderStyle.none
            passwordTextField.layer.addSublayer(bottomPasswordLine)
             emailTextField.layer.addSublayer(bottomEmailLine)
    }
    
    func onLogInError() {
        emailImage.image = #imageLiteral(resourceName: "invalid_email")
        passwordImage.image = #imageLiteral(resourceName: "invalid_password")
        changeBorderColor(color: UIColor.red.cgColor)
        invalidLabel.isHidden = false
        emailTextField.attributedPlaceholder = NSAttributedString(string: "e-mail",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        Animations.requireUserAtencion(on: MainView)
    }
    
   
    @IBOutlet weak var passwordImage: UIImageView!
    
   
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if let password = passwordTextField.text, password.isEmpty {
            onLogInError()
        }
        
        if let email = emailTextField.text, email.isEmpty {
             onLogInError()
          }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeBorderColor(color: UIColor.gray.cgColor)
        
    }
    


}

