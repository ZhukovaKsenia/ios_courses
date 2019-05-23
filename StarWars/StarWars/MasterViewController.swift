//
//  MasterViewController.swift
//  StarWars
//
//  Created by Ksenia on 27/03/2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

protocol FilmSelectionDelegate: class {
    func filmSelected(_ newFilm: SWFilm)
}

class MasterViewController: UITableViewController {

    private let identifier = "filmsListCell"
    let films = [
        SWFilm(title: "A New Hope", director: "1", producer: "1p", openingText: "1djkfbvjhdbfvjhdfbvjhdbvjhvbjmbdjmvbfjvhbfjhv", episodeNumber: 4/*, releaseDate: Date*/),
        SWFilm(title: "The Empire Strikes Back", director: "2", producer: "2p", openingText: "hgnfngn", episodeNumber: 5/*, releaseDate: Date*/),
        SWFilm(title: "Return Of The Jedi", director: "3", producer: "3p", openingText: "sgn", episodeNumber: 6/*, releaseDate: Date*/),
        SWFilm(title: "The Phantom Menace", director: "4", producer: "4p", openingText: "sfgnbgnfnn", episodeNumber: 1/*, releaseDate: Date*/),
        SWFilm(title: "Attack Of The Clones", director: "5", producer: "5p", openingText: "fgn", episodeNumber: 2/*, releaseDate: Date*/),
        SWFilm(title: "Revenge Of The Sith", director: "6", producer: "6p", openingText: "fgn", episodeNumber: 3/*, releaseDate: Date*/),
        SWFilm(title: "The Force Awakens", director: "7", producer: "7p", openingText: "gnf", episodeNumber: 7/*, releaseDate: Date*/)
    ]
    
    
    
    weak var delegate: FilmSelectionDelegate?
    //override func viewDidLoad() {
  //      super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
  //  }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let film = films[indexPath.row]
        cell.textLabel?.text = film.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFilm = films[indexPath.row]
        delegate?.filmSelected(selectedFilm)
        
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
