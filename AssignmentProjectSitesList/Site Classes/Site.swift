//
//  Site.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 04/02/22.
//

import Foundation
import UIKit

class Site {
    
    var icon: UIImage
    var url: String
    var name: String
    var sectorFolder: String
    var userName: String
    var password: String
    var notes: String?
    
    init(icon: UIImage, url: String, name: String, sectorFolder: String, userName: String, password: String, notes: String) {
        self.icon = icon
        self.url = url
        self.name = name
        self.sectorFolder = sectorFolder
        self.userName = userName
        self.password = password
        self.notes = notes
    }
}
