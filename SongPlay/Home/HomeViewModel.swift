//
//  HomeViewModel.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    
    var artistList = [Artist]()
    
    var searchWord: ((_ word: String) -> Void)?
    var showNextPage: ((_ pageNumber: Int) -> Void)?
    var openSongDetail: ((_ artist: Artist) -> Void)?
    
    var pageNumber: Int = 0
    
    func callingHTTPApiRequest(word: String, completion: @escaping (_ success: Bool) -> Void) {
        NetworkManager.shared.callingHTTPApiRequest(word: word) { [weak self] artistModel in
//            guard let
            print(artistModel)
            self?.artistList += artistModel.results
            completion(true)
        }
    }
    
    
}

extension HomeViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.identifier, for: indexPath) as? ArtistTableViewCell {
            cell.item = artistList[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//
        // Navigate here
        openSongDetail!(artistList[indexPath.row])
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == artistList.count {
            // Load API here
            pageNumber += 1
            showNextPage!(pageNumber)
        }
    }
    
    
    
    
}

extension HomeViewModel: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Changed text is \(searchBar.text)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Text is \(searchBar.text)")
        searchWord!(searchBar.text!)
        // Call API here
    }
    
}
