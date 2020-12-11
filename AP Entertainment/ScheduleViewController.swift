//
//  ScheduleViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 10/3/20.
//

import UIKit

class ScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
   
    let venues = [Venue(name: "The Brickyard", day: "Monday", time: "8pm", imageName: "brickyard"), Venue(name: "The Colonial", day: "Tuesday", time: "8pm", imageName: "colonial"), Venue(name: "The Galley", day: "Wednesday", time: "8pm", imageName: "galley")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "venueCell", for: indexPath) as! ScheduleCollectionViewCell
        let currentVenue = self.venues[indexPath.row]
        cell.dayLabel.text = currentVenue.day + ", " + currentVenue.time
        cell.venueImageView.image = UIImage(named: currentVenue.imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = 8
        let width = (Int(self.scheduleCollectionView.frame.width) - (spacing))
        let height = (Int(self.scheduleCollectionView.frame.height) - (spacing))/3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? VenueDetailViewController {
            detailVC.selectedVenue = self.venues[scheduleCollectionView.indexPathsForSelectedItems![0].row]
        }
    }
    

}
