//
//  SignUpViewController.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 03/02/22.
//

import UIKit

class SignUpViewController: UIViewController {
    var users = [User]()
    var signInVc = MasterViewController()
    
    var signUpStatus = false

    @IBOutlet weak var mobileNoTextFeild: UITextField!
    @IBOutlet weak var mPinTextFeild: UITextField!
    @IBOutlet weak var reMPinTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        

        guard let mobileNo = mobileNoTextFeild.text else { return }
        guard let mPin  = mPinTextFeild.text else { return }
        guard let reMPin = reMPinTextFeild.text else {return}
        if mobileNo.count == 10 && mPin == reMPin {
            let phone = Int(mobileNo)!
            let mPin = Int(mPin)!
            users.append(User(phoneNumber: phone, mPin: mPin))
            signUpStatus = true
//            guard let signUpSucessVC = storyboard?.instantiateViewController(withIdentifier: "S")
            
        } else {
            print("Check the values you've entered")
        }
        
        
        
    }
    
    
}
