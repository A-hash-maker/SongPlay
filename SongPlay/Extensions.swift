//
//  Extensions.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
