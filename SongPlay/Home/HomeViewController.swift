//
//  ViewController.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var artistTableView: UITableView!
    
    var viewModel = HomeViewModel()
    
    var currenrArtist: Artist?

    override func viewDidLoad() {
        super.viewDidLoad()
        artistTableView.delegate = viewModel
        artistTableView.dataSource = viewModel
        artistTableView.register(UINib(nibName: "artistTableViewCell", bundle: nil), forCellReuseIdentifier: ArtistTableViewCell.identifier)
        search.placeholder = "Search your artist"
        search.delegate = viewModel
        
        callHTTPAPI()
        viewModel.searchWord = { [weak self] word in
            self?.callHTTPAPI(word: word)
            self?.view.endEditing(true)
        }
        
        viewModel.showNextPage = { [weak self] pageNumber in
//            view
        }
        
        viewModel.openSongDetail = { [weak self] artist in
            self?.currenrArtist = artist
            self?.navigateToSecondVC()
        }
    }
    
    func navigateToSecondVC() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.artist = currenrArtist
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func callHTTPAPI(word: String = "") {
        viewModel.callingHTTPApiRequest(word: word) { success in
            if success {
                DispatchQueue.main.async {
                    self.artistTableView.reloadData()
                }
            }
        }
    }
    

}

