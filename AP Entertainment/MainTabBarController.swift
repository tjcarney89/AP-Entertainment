//
//  MainTabBarController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/17/20.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let backgroundColor = UIView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let showAboutTap = UITapGestureRecognizer(target: self, action: #selector(self.showAboutInfo(_sender:)))

        
        let tabBarWidth = tabBar.frame.size.width
        let tabBarHeight = tabBar.frame.size.height
        let itemSize = CGSize(width: tabBarWidth / 5, height: tabBarHeight)
        
        for (index, _) in tabBar.items!.enumerated() {
            if index == 1 {
                let yPosition = itemSize.height
                
                
                // Makes Custom Tab Bar Button
                view.addSubview(backgroundColor)
                backgroundColor.translatesAutoresizingMaskIntoConstraints = false
                backgroundColor.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
                backgroundColor.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: -yPosition).isActive = true
                backgroundColor.widthAnchor.constraint(equalToConstant: itemSize.width).isActive = true
                backgroundColor.heightAnchor.constraint(equalToConstant: itemSize.width).isActive = true
                backgroundColor.layer.cornerRadius = itemSize.width/2
                backgroundColor.layer.masksToBounds = true
                backgroundColor.backgroundColor = UIColor.clear
                
                
                let logoImageView = UIImageView()
                backgroundColor.addSubview(logoImageView)
                logoImageView.translatesAutoresizingMaskIntoConstraints = false
                logoImageView.centerYAnchor.constraint(equalTo: backgroundColor.centerYAnchor).isActive = true
                logoImageView.centerXAnchor.constraint(equalTo: backgroundColor.centerXAnchor).isActive = true
                logoImageView.widthAnchor.constraint(equalTo: backgroundColor.widthAnchor, multiplier: 1.0).isActive = true
                logoImageView.heightAnchor.constraint(equalTo: backgroundColor.heightAnchor, multiplier: 1.0).isActive = true

                logoImageView.image = (UIImage(named: "logo"))
                logoImageView.contentMode = .scaleAspectFit
                logoImageView.mask?.clipsToBounds = true
                logoImageView.isUserInteractionEnabled = true
                logoImageView.becomeFirstResponder()
                logoImageView.addGestureRecognizer(showAboutTap)
                
            }
        }
        FirebaseClient.fetchQuestionOfTheDay { (questionOfTheDay) in
            let questionVC = self.viewControllers?[1] as! QuestionOfTheDayViewController
            questionVC.question = questionOfTheDay.question
            questionVC.answer = questionOfTheDay.answer
        }
        
    }
    
    @objc func showAboutInfo(_sender: UITapGestureRecognizer) {
        print("BUTTON TAPPED!")
    }
    
}
