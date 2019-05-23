//
//  Monster.swift
//  StarWars
//
//  Created by Ksenia on 27/03/2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class SWFilm {
    let title: String
    let director: String
    let producer: String
    let openingText: String
    let episodeNumber: Int
    //let releaseDate: Date

    
    init(title: String, director: String, producer: String, openingText: String, episodeNumber: Int/*, releaseDate: Date*/) {
        self.title = title
        self.director = director
        self.producer = producer
        self.openingText = openingText
        self.episodeNumber = episodeNumber
        //self.releaseDate = releaseDate
    }
    
    var filmPosterImage: UIImage {
        switch episodeNumber {
        case 1:
            return UIImage(named: "thePhantomMenace4")!
        case 2:
            return UIImage(named: "attackOfTheClones5")!
        case 3:
            return UIImage(named: "revengeOfTheSith6")!
        case 4:
            return UIImage(named: "aNewHope1")!
        case 5:
            return UIImage(named: "theEmpireStrikesBack2")!
        case 6:
            return UIImage(named: "returnOfTheJedi3")!
        case 7:
            return UIImage(named: "theForceAwakens7")!
        default:
            return UIImage(named: "thePhantomMenace4")!
        }
    }
}
