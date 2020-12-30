//
//  AboutViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/28/20.
//

import UIKit

class AboutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var contactMethodCollectionView: UICollectionView!
    
    let contactMethods = ContactMethods.retrieveContactMethods()
    let socialMedia = ContactMethods.retrieveSocialMedia()
    var allMethods: [[ContactMethod]] {
        return [contactMethods, socialMedia]
    }
        
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactMethodCollectionView.delegate = self
        self.contactMethodCollectionView.dataSource = self

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return contactMethods.count
        } else {
            return socialMedia.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCell", for: indexPath) as! SocialMediaCollectionViewCell
        let selectedContactMethod = allMethods[indexPath.section][indexPath.row]
        cell.iconImageView.image = UIImage(named: selectedContactMethod.image)
        //cell.contactLabel.text = selectedContactMethod.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let spacing = 200
        //let square = (Int(self.contactMethodCollectionView.frame.width) - (spacing))/2
        if indexPath.section == 0 {
            let square = ((self.contactMethodCollectionView.frame.width)/5)*1.15
            return CGSize(width: square, height: square)
        } else {
            let square = (Int(self.contactMethodCollectionView.frame.width))/5
            return CGSize(width: square, height: square)
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = collectionView.frame.width
        if section == 0 {
            let itemWidth = (collectionView.frame.width/5)*1.15
            let totalContentWidth = (itemWidth*2) + 20
            let padding = (width - totalContentWidth)/2
            return UIEdgeInsets(top: 20, left: padding, bottom: 0, right: padding)
        } else {
            let itemWidth = (collectionView.frame.width/5)
            let totalContentWidth = (itemWidth*3) + 40
            let padding = (width - totalContentWidth)/2
            return UIEdgeInsets(top: 20, left: padding, bottom: 0, right: padding)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedContactMethod = self.allMethods[indexPath.section][indexPath.row]
        self.openURL(url: selectedContactMethod.url)
    }
    
    func openURL(url: String) {
        guard let link = URL(string: url) else {return}
        if UIApplication.shared.canOpenURL(link) {
            UIApplication.shared.open(link, options: [:], completionHandler: nil)
        }
    }
    

    

}
