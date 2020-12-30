//
//  SocialMediaCollectionViewCell.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/28/20.
//

import UIKit

class SocialMediaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 15
        iconImageView.contentMode = .scaleToFill        


    }
    
}
