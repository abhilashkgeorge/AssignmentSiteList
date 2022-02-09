//
//  AddSitesViewController.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 05/02/22.
//

import UIKit

protocol PassDataToDetailedVC {
    func sendData(url: String, siteName :String, sector: String, userName: String, password: String, note: String)
}
class AddSitesViewController: UIViewController {

  
    @IBOutlet weak var urlTxtFeild: UITextField!
    @IBOutlet weak var nameTxtFeild: UITextField!
    @IBOutlet weak var sectorTxtFeild: UITextField!
    @IBOutlet weak var userNameTxtFeild: UITextField!
    @IBOutlet weak var passwordTxtFeild: UITextField!
    @IBOutlet weak var notesTxtFeild: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    var siteName = ""
    var url = ""
    var sector = ""
    var userName = ""
    var password = ""
    var notes = ""
    var saveDelegate : PassDataToDetailedVC?
    let detailedViewController  = DetailedViewController()
    
    var displaySiteDetailesStatus = false
    var displayEditDetailsStatus = false
    
    var siteList = SiteList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        displaySiteDetails()

    }
    func displaySiteDetails() {
        
        if displaySiteDetailesStatus == true {
            saveButton.isHidden = true
            resetButton.isHidden = true
            urlTxtFeild.isUserInteractionEnabled = false
            nameTxtFeild.isUserInteractionEnabled = false
            sectorTxtFeild.isUserInteractionEnabled = false
            userNameTxtFeild.isUserInteractionEnabled = false
            passwordTxtFeild.isUserInteractionEnabled = false
            notesTxtFeild.isUserInteractionEnabled = false
            
        }
        
    }
    
    func displayEditDetails() {
        if displayEditDetailsStatus == true {
            saveButton.isHidden = true
            resetButton.isHidden = true
            updateButton.isHidden = false
            
        }
    }
    func fillData() {
        
        urlTxtFeild.text = url
        nameTxtFeild.text = siteName
        sectorTxtFeild.text = sector
        userNameTxtFeild.text = sector
        passwordTxtFeild.text = password
        notesTxtFeild.text = notes
    }
    
    func updateButtonView() {
        
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        urlTxtFeild.text = ""
        nameTxtFeild.text = ""
        sectorTxtFeild.text = ""
        userNameTxtFeild.text = ""
        passwordTxtFeild.text = ""
        notesTxtFeild.text = ""
    }
    

    @IBAction func saveButtonTapped(_ sender: Any) {
        saveDelegate?.sendData(
            url: urlTxtFeild?.text ?? "",
            siteName: nameTxtFeild?.text ?? "",
            sector: sectorTxtFeild?.text ?? "",
            userName: userNameTxtFeild?.text ?? "",
            password: passwordTxtFeild?.text ?? "",
            note: notesTxtFeild?.text ?? "")
        
        
        let newSite = Site(icon: UIImage(named: "fb")!, url: urlTxtFeild.text ?? "", name: nameTxtFeild.text ?? "", sectorFolder: sectorTxtFeild.text ?? "", userName: userNameTxtFeild.text ?? "", password: passwordTxtFeild.text ?? "", notes: notesTxtFeild.text ?? "")
        siteList.sites.append(newSite)
    // reload the table
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func updateBtnTapped(_ sender: Any) {
        
        //implement updation
    }
}
//extension AddSitesViewController: UINavigationControllerDelegate {
    
//}
