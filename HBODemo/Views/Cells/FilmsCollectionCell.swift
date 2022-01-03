//
//  FilmsCollectionCell.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import UIKit

class FilmsCollectionCell: UICollectionViewCell {
    static let identifier = "FilmsCollectionCell"
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var MovieBackGround: UIView!
    

    func setupCell(data: Movie) {
        MovieBackGround.layer.cornerRadius = 5
        movieImage.layer.cornerRadius = 5
        movieImage.loadImageFromUrl(imgUrl:  "https://image.tmdb.org/t/p/w500/\(data.poster_path ?? "")", defString: "placeholder")
    }
}
