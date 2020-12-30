//
//  VenueDetailViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/10/20.
//

import UIKit

class VenueDetailViewController: UIViewController {
    @IBOutlet weak var venueImageView: UIImageView!
    @IBOutlet weak var takeoutButton: UIButton!
    @IBOutlet weak var bingbiteButton: UIButton!
    @IBOutlet weak var zoomButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var selectedVenue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.venueImageView.image = UIImage(named: "\(selectedVenue.imageName)-detail")
        self.descriptionTextView.text = selectedVenue.description
        self.formatButtons(buttons: [takeoutButton, zoomButton, bingbiteButton])

    }
    
    func formatButtons(buttons: [UIButton]) {
        self.takeoutButton.setTitle("Call \(selectedVenue.name)", for: .normal)
        if !selectedVenue.onBingBite {
            bingbiteButton.isHidden = true
        }
        for button in buttons {
            button.layer.cornerRadius = 15
        }
    }
    
    @IBAction func takeoutButtonPressed(_ sender: Any) {
        guard let phoneNumber = URL(string: "tel://\(selectedVenue.phoneNumber)") else {return}
        if UIApplication.shared.canOpenURL(phoneNumber) {
            UIApplication.shared.open(phoneNumber, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func zoomButtonPressed(_ sender: Any) {
        let andyZoom = "https://us02web.zoom.us/j/6076241656?pwd=S1NWdFh6LzAvOE1xVVRxVU1sZTQxQT09&fbclid=IwAR1y8R_e82WQDvEww0l--7ZDb648QiIKJc_J2xZ9ik8D7qsTZvXTT7jiYEY#success"
        guard let zoomLink = URL(string: andyZoom) else {return}
        if UIApplication.shared.canOpenURL(zoomLink) {
            UIApplication.shared.open(zoomLink, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func bingBiteButtonPressed(_ sender: Any) {
        guard let url = URL(string: selectedVenue.bingBiteURL) else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
