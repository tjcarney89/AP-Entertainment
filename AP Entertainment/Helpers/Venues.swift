//
//  Venues.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/17/20.
//

import Foundation

class Venues {
    
    class func retrieveAll() -> [Venue] {
        let brickyard = Venue(name: "The Brickyard", day: "Monday", time: "8pm", imageName: "brickyard", description: "A community-centered bar and restaurant, located in the Park Manor Plaza in Endwell, NY! Open 7 days a week.", phoneNumber: "6072051031", onBingBite: true, bingBiteURL: "https://www.bingbite.com/r/585/restaurants/delivery/Bar-Grill/The-Brickyard-Endwell-Endwell")
        let colonial = Venue(name: "The Colonial", day: "Tuesday", time: "8pm", imageName: "colonial", description: "Many have claimed it to be the greatest bar in New York State. Others have said it to be the best bar between 56 and 58 Court Street in Binghamton. From our selection of seasoned fries to our Bearnaise Burger, our gastropub inspired menu has something for everyone! Choose from our 21 tap beers, specialty cocktails and wines!", phoneNumber: "6072387741", onBingBite: false, bingBiteURL: "")
        let galley = Venue(name: "The Galley", day: "Wednesday", time: "8pm", imageName: "galley", description: "The Galley Tavern & Grill is a family style sports bar and grill. With 15 TVs throughout the restaurant, The Galley has the best viewing in town!", phoneNumber: "6077486544", onBingBite: true, bingBiteURL: "https://www.bingbite.com/r/232/restaurants/delivery/Bar-Grill/The-Galley-Endwell")
        let beerTree = Venue(name: "Beer Tree Brew Co", day: "Thursday", time: "6:30pm", imageName: "beer-tree", description: "Beer Tree Brew is a farm microbrewery located in Port Crane NY. At Beer Tree, we're not only a brewery focused on brewing delicious beer for you, we're a community of passionate people living life to the fullest!", phoneNumber: "6072040712", onBingBite: false, bingBiteURL: "")
        return [brickyard, colonial, galley, beerTree]
    }
}
