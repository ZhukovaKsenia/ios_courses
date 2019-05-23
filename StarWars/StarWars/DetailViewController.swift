//
//  DetailViewController.swift
//  StarWars
//
//  Created by Ksenia on 27/03/2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var filmPosterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var filmDirectorLabel: UILabel!
    @IBOutlet weak var filmProducerLabel: UILabel!
    @IBOutlet weak var filmOpeningTextLabel: UILabel!
    @IBOutlet weak var filmEpisodeNumberLabel: UILabel!
    @IBOutlet weak var filmReleaseDateLabel: UILabel!
    @IBOutlet weak var planetsTableView: UITableView!
    
    var film: SWFilm? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        filmPosterImageView.image = film?.filmPosterImage
        filmTitleLabel.text = film?.title
        filmDirectorLabel.text = film?.director
        filmProducerLabel.text = film?.producer
        filmOpeningTextLabel.text = film?.openingText
        let number: Int? = film?.episodeNumber
        if let episodeNum = number {
            filmEpisodeNumberLabel.text = String(episodeNum)
        } else {
            filmEpisodeNumberLabel.text = "---"
        }
        
        
        //filmReleaseDateLabel.text = film?.releaseDate
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: FilmSelectionDelegate {
    func filmSelected(_ newFilm: SWFilm) {
        film = newFilm
    }
}
