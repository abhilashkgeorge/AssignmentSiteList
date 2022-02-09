//
//  SiteList.swift
//  AssignmentProjectSitesList
//
//  Created by Abhilash k George on 04/02/22.
//

import Foundation
import UIKit

class SiteList {
    
    var sites: [Site] = [Site]()
    
    init() {
        self.createArray()
        
    }
    func createArray() {
        sites.append(Site(icon: UIImage(named: "fb")!, url: "www.fb.com", name: "Facebook", sectorFolder: "unknown", userName: "userabhi", password: "user@123", notes: "First Site"))
        sites.append(Site(icon: UIImage(named: "yt")!, url: "www.youtube.com", name: "Youtube", sectorFolder: "unknown", userName: "userabhi", password: "user@123", notes: "Third Site"))
        sites.append(Site(icon: UIImage(named: "twitter")!, url: "www.twitter.com", name: "Instagram", sectorFolder: "unknown", userName: "userabhi", password: "user@123", notes: "Fourth Site"))
        sites.append(Site(icon: UIImage(named: "ig")!, url: "www.insta.com", name: "Instagram", sectorFolder: "unknown", userName: "userabhi", password: "user@123", notes: "Fifth Site"))
        sites.append(Site(icon: UIImage(named: "pint")!, url: "www.pinterest.com", name: "Pinterest", sectorFolder: "unknown", userName: "userabhi", password: "user@123", notes: "Sixth Site"))
        
    }
}
