//
//  File.swift
//  deliveryapp
//
//  Created by Hesong Huang on 2018/4/8.
//  Copyright © 2018年 Hesong Huang. All rights reserved.
//


import UIKit
import Firebase

class LoginVC : UIViewController{
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
  
    @IBOutlet weak var Login: UIButton!
    
    
    @IBOutlet weak var LoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var isSignIn:Bool = true
    
    @IBAction func SigninRegister(_ sender: Any) {
        isSignIn = !isSignIn
        if isSignIn {
            LoginLabel.text = "Sign In"
            Login.setTitle( "SignIn", for : .normal)
        }
        else{
            LoginLabel.text = "Register"
            Login.setTitle("Register",for:.normal)
        }
    }
    
   

    @IBAction func Login(_ sender: Any) {
        if EmailTextField.text != "" && PasswordTextField.text != ""
        {
            if isSignIn{
                Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!,completion: {
                    (user, error) in
                    if user != nil {
                        //Sign in successful
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }
                    else
                    {
                        //Error finding user
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }else{
                            print("ERROR")
                        }
                    }
                })
            }else{
                Auth.auth().createUser(withEmail: EmailTextField.text!, password: PasswordTextField.text!, completion:{ (user,error) in
                    if user != nil
                    {
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }else{
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }else{
                            print("ERROR")
                        }
                    }
                } )
            }
            
        }else{
            print("Error")
            
        }
    }
    
    
}
