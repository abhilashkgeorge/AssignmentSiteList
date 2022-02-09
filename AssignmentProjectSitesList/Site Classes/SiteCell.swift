//
//  SiteCell.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 05/02/22.
//

import Foundation
import UIKit

class SiteCell: UITableViewCell {
    
    
    @IBOutlet weak var siteUrlLbl: UILabel!
    @IBOutlet weak var siteNameLbl: UILabel!
    @IBOutlet weak var siteIcon: UIImageView!
    
    @IBAction func copyPasswordTapped(_ sender: Any) {
    }
    
    func setSiteCell(site: Site) {
        siteIcon.image = site.icon
        siteNameLbl.text = site.name
        siteUrlLbl.text = site.url
        
    }
}

