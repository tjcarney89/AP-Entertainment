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
    @IBOutlet weak var zoomButton: UIButton!
    
    var selectedVenue: Venue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.venueImageView.image = UIImage(named: "\(selectedVenue.imageName)-detail")
        self.formatButtons(buttons: [takeoutButton, zoomButton])

        // Do any additional setup after loading the view.
    }
    
    func formatButtons(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 15
        }
    }
    
    @IBAction func takeoutButtonPressed(_ sender: Any) {
    }
    
    @IBAction func zoomButtonPressed(_ sender: Any) {
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
