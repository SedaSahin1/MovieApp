//
//  MovieItem.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation
import UIKit

class MovieItem: UICollectionViewCell {
    @IBOutlet weak var itemView: UIView!{
        didSet{
            itemView.layer.cornerRadius = 8
            itemView.layer.borderColor = UIColor.gray.cgColor
            itemView.layer.borderWidth = 0.5
        }
    }
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!{
        didSet{
            movieImage.layer.cornerRadius = 4
        }
    }
}
