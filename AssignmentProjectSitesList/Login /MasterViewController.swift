//
//  ViewController.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 02/02/22.
//

import UIKit

class MasterViewController: UIViewController {
    
    var signInVc = UIViewController()
    var signUpVc = UIViewController()
    
    //var signUpStatus = SignUpViewController()
    
    @IBOutlet weak var signUpSuccessLbl: UILabel!
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var headerSignInBtn: UIButton!
    @IBOutlet weak var headerSignUpBtn: UIButton!
    @IBOutlet weak var reactGoldView: UIView!
    
    //let signInVc = SignInViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSignIn()
        setColour()
    }
    
    func setColour(){
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "#20BBFF")!.cgColor, UIColor(named: "#0E85FF")!.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func headerSignInTapped(_ sender: Any) {
        showSignIn()
    }
    @IBAction func headerSignUpTapped(_ sender: Any) {
        showSignUp()
    }
    
    var status = false
    func showSignIn() {
        reactGoldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([reactGoldView.centerXAnchor.constraint(equalTo: headerSignInBtn.centerXAnchor)
        ])

        if status == false {
            signInVc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            signUpVc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            status = true
        }
        
        remove(asChildViewController: signUpVc)
        add(asChildViewController: signInVc)

    }
    
    
    func showSignUp() {
//        reactGoldView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([reactGoldView.centerXAnchor.constraint(equalTo: headerSignInBtn.centerXAnchor)        ])
        

        remove(asChildViewController: signInVc)
        add(asChildViewController: signUpVc)
   
    }
    
    private func add(asChildViewController viewController: UIViewController) {
       
        addChild(viewController)
        mainContainerView.addSubview(viewController.view)
        viewController.view.frame = mainContainerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

