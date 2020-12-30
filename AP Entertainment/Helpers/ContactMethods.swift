//
//  ContactMethods.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/28/20.
//

import Foundation
import UIKit

class ContactMethods {
    
    static let phone = ContactMethod(image: "phone", name: "Phone", url: "tel://607-624-1656")
    static let email = ContactMethod(image: "email", name: "Email", url: "mailto:apentertainment607@gmail.com")
    static let facebook = ContactMethod(image: "facebook", name: "Facebook", url: "https://www.facebook.com/APEntertainment")
    static let instagram = ContactMethod(image: "instagram", name: "Instagram", url: "https://instagram.com/APEntertainment")
    static let snapchat = ContactMethod(image: "snapchat", name: "Snapchat", url: "https://www.snapchat.com/add/apentertainment")

    class func retrieveAll() -> [ContactMethod] {
        return [phone, email, facebook, instagram, snapchat]
    }
    
    class func retrieveContactMethods() -> [ContactMethod] {
        return [phone, email]
    }
    
    class func retrieveSocialMedia() -> [ContactMethod] {
        return [facebook, instagram, snapchat]
    }
}
