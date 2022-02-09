//
//  SignInViewController.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 03/02/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    let signUpVc = SignUpViewController()
    

    @IBOutlet weak var mobileTextFeild: UITextField!
  
    @IBOutlet weak var mPinTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func signInButtonTapped(_ sender: Any) {
        let signedUpUsers = signUpVc.users
        //print("this is passd\(signedUpUsers[0].phoneNumber)")
        if mobileTextFeild.text == "" && mPinTextFeild.text == "" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
            navigationController?.pushViewController(vc, animated: false)
            
        } else {
            print("Auth failed")
        }
            
            
    }
    
}
