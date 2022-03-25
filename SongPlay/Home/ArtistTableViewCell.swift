//
//  artistTableViewCell.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import UIKit
import Kingfisher

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImg: UIImageView!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var trackNameLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    var item: Artist! {
        didSet {
            artistNameLbl.text = item.artistName
//            genreLbl.text = item.primaryGenreName
////            trackNameLbl.text = item.t
////            durationLbl.text = item.
//            priceLbl.text = "\(item.collectionPrice ?? 0.0)"
//
//
//
            if URL(string: item.artworkUrl100) != nil {
                let resource = ImageResource(downloadURL: URL(string: item.artworkUrl100)!, cacheKey: item.artworkUrl100)
                artworkImg.kf.setImage(with: resource, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
            }
            
            
        }
    }
    
}
