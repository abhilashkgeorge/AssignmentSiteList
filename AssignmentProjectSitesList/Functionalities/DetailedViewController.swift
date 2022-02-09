//
//  DetailedViewController.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 04/02/22.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var circularCountLbl: UILabel!
    @IBOutlet weak var siteTableView: UITableView!
    @IBOutlet weak var verticalHeaderStackView: UITableView!
    
    
    var siteList = SiteList()
    var site = [Site]()
    var index = 0
    var indexes : [IndexPath] = []
    var siteTable = UITableView()
    var blurViewMain = UIView()
    
    var siteCellView = SiteCell()
   // var addSiteVC = AddSitesViewController()
    var editSiteVC = UIViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        site = siteList.sites
        siteTableView.delegate = self
        siteTableView.dataSource = self
        self.circularCountLbl.layer.cornerRadius = 10
        
 }
    
    func configureItems() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(named: "#0E85FF")
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "profile"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(named: "sync_icn"), style: .done, target: self, action: #selector(handleSyncSiteList)),
            UIBarButtonItem(image: UIImage(named: "search"), style: .done, target: self, action: #selector(handleSearch)),
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "burger_menu"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(named: "PASS MANAGER"), style: .done, target: self, action: nil)
        ]
    }
    @objc func handleSyncSiteList() {
        showingSync()
        Timer.scheduledTimer(timeInterval: 1,
            target: self,
            selector: #selector(removeSync),
            userInfo: nil,
            repeats: false)
    }
    
    @objc func showingSync() {
        let blurView = UIView(frame: UIScreen.main.bounds)
        blurView.backgroundColor = UIColor(named: "#323232")
        blurView.alpha = 0.85
        blurView.addToWindow()
        
        let syncingText = UILabel()
        syncingText.translatesAutoresizingMaskIntoConstraints = false
        syncingText.font = UIFont(name: "OpenSans-SemiBold", size: 20)
        syncingText.text = "Data sync in progress \nplease wait"
        syncingText.textAlignment = .center
        syncingText.numberOfLines = 2
        syncingText.textColor = .white
        blurView.addSubview(syncingText)
        
        let icon = UIImage(named: "syncing")
        let imageView = UIImageView(image: icon!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        blurView.addSubview(imageView)
        blurViewMain = blurView
      
        

        NSLayoutConstraint.activate([
            syncingText.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            syncingText.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -30),

             imageView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor)
             ])
    }
    @objc func removeSync() {
        blurViewMain.removeFromSuperview()
    }
    @objc func handleSearch() {

        let searchTxtFeild = UITextField()
        searchTxtFeild.placeholder = "Type kewords to search"
        searchTxtFeild.backgroundColor = .white
        searchTxtFeild.textColor = UIColor(named: "#B3B3B3")
        searchTxtFeild.font = UIFont(name: "OpenSans-Regular", size: 14)
        searchTxtFeild.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTxtFeild)
        
        var image = UIImage()
        image = UIImage(named: "back")!
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 50, y: 50, width: 20, height: 20)
        
        searchTxtFeild.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            searchTxtFeild.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            searchTxtFeild.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTxtFeild.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTxtFeild.heightAnchor.constraint(equalToConstant: 60),
            
          
            
        ])
    }
    @IBAction func addSitesButtonTapped(_ sender: Any) {
        
        guard let addSitesVC = storyboard?.instantiateViewController(withIdentifier: "AddSitesViewController") as? AddSitesViewController else { return }
        
        addSitesVC.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "back"),
                              style: .done, target: self,
                              action: #selector(backBtnTapped)),
            
                        UIBarButtonItem(title: "Add Site",
                                          style: .done,
                                          target: self,
                                          action: nil)
                ]

        navigationController?.pushViewController(addSitesVC, animated: true)
        
    }
    @objc func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
        override func viewWillAppear(_ animated: Bool) {
            siteTableView.reloadRows(at: indexes, with: .middle)
    }
@objc func handleBtnTapped() {
    
}
}
extension DetailedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return site.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndex = site[indexPath.row]
        let newCell = tableView.dequeueReusableCell(withIdentifier: "siteCell") as! SiteCell
        newCell.setSiteCell(site: cellIndex)
        siteTableView = tableView
        return newCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let site = site[indexPath.row]
        guard let addSitesVC = storyboard?.instantiateViewController(withIdentifier: "AddSitesViewController") as? AddSitesViewController else { return }
        addSitesVC.displaySiteDetailesStatus = true
        addSitesVC.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "back"),
                            style: .done,
                            target: self,
                            action: #selector(backBtnTapped)),
            UIBarButtonItem(title: "Site Details",
                              style: .done,
                              target: self,
                              action: nil)
        ]
        addSitesVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit",
                              style: .done,
                              target: self,
                              action: #selector(editBtnTapped)
        )
        addSitesVC.url = site.url
        addSitesVC.siteName = site.name
        addSitesVC.sector = site.sectorFolder
        addSitesVC.userName = site.userName
        addSitesVC.password = site.password
        addSitesVC.notes = site.notes ?? ""
        addSitesVC.saveDelegate = self
        index = indexPath.row
        indexes = [indexPath]
        editSiteVC = addSitesVC
        
        navigationController?.pushViewController(addSitesVC, animated: true)
       
        
    }
    
    @objc func editBtnTapped() {
             //guard let addSitesVC = storyboard?.instantiateViewController(withIdentifier: "AddSitesViewController") as? AddSitesViewController else { return }
        
       // addSitesVC.displayEditDetailsStatus = true
        
        let UpdateButton = UIButton()
        UpdateButton.translatesAutoresizingMaskIntoConstraints = false
        UpdateButton.setTitle("UPDATE", for: .normal)
        UpdateButton.backgroundColor = UIColor(named: "#0E85FF")
        UpdateButton.tintColor = .white
        editSiteVC.view.addSubview(UpdateButton)
        
        viewWillAppear(true)
        
        NSLayoutConstraint.activate([
            UpdateButton.centerXAnchor.constraint(equalTo: editSiteVC.view.centerXAnchor),
           // UpdateButton.centerYAnchor.constraint(equalTo: editSiteVC.view.centerYAnchor)
            UpdateButton.bottomAnchor.constraint(equalTo: editSiteVC.view.layoutMarginsGuide.bottomAnchor, constant: 0),
            UpdateButton.leftAnchor.constraint(equalTo: editSiteVC.view.leftAnchor),
            UpdateButton.rightAnchor.constraint(equalTo: editSiteVC.view.rightAnchor),
            UpdateButton.heightAnchor.constraint(equalToConstant: 60)
        ])

        
        
        editSiteVC.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "back"),
                            style: .done,
                            target: self,
                            action: #selector(backBtnTapped)),
            UIBarButtonItem(title: "Edit",
                            style: .done,
                            target: self,
                            action: nil)
        ]
        editSiteVC.navigationItem.rightBarButtonItems = []
        
    }
    
}
extension DetailedViewController: PassDataToDetailedVC {
    func sendData(url: String, siteName: String, sector: String, userName: String, password: String, note: String) {
        let siteData = site[index]
        siteData.icon = UIImage(named: "fb")!
        siteData.url = url
        siteData.name = siteName
        siteData.sectorFolder = sector
        siteData.userName = userName
        siteData.password = password
        siteData.notes = note
        
    }
    
    
}
extension UIView {

    func addToWindow()  {
        let window = UIApplication.shared.keyWindow!
        self.frame = window.bounds
        window.addSubview(self)
        
    }
}

