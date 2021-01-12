//
//  ScheduleViewController.swift
//  AP Entertainment
//
//  Created by TJ Carney on 10/3/20.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
   
    let venues = Venues.retrieveAll()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.tableFooterView = UIView()
        //scheduleCollectionView.delegate = self
        //scheduleCollectionView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "venueCell", for: indexPath) as! VenueTableViewCell
        let currentVenue = venues[indexPath.row]
        cell.logoImageView.image = UIImage(named: currentVenue.imageName)
        cell.dateTimeLabel.text = "\(currentVenue.day), \(currentVenue.time)"
        cell.descriptionTextView.text = currentVenue.description
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        self.venues.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "venueCell", for: indexPath) as! ScheduleCollectionViewCell
//        let currentVenue = self.venues[indexPath.row]
//        cell.dayLabel.text = currentVenue.day + ", " + currentVenue.time
//        cell.venueImageView.image = UIImage(named: currentVenue.imageName)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let spacing = 8
//        let width = (Int(self.scheduleCollectionView.frame.width) - (spacing))
//        let height = (Int(self.scheduleCollectionView.frame.height) - (spacing))/3
//        return CGSize(width: width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0
//    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? VenueDetailViewController {
            let selectedIndex = scheduleTableView.indexPathForSelectedRow?.row
            detailVC.selectedVenue = self.venues[selectedIndex!]
        }
    }
    

}
