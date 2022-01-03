//
//  DetailsViewController.swift
//  HBODemo
//
//  Created by Essam Orabi on 03/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    let posterImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()

    let posterDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    var imageURL = ""
    var movDescription = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = .systemBackground
        posterImage.loadImageFromUrl(imgUrl: "https://image.tmdb.org/t/p/w500/\(imageURL)", defString: "placeholder")
        posterDescription.text = movDescription
        view.addSubview(posterImage)
        view.addSubview(posterDescription)
        posterImageViewConstraints()
    }

    func posterImageViewConstraints() {
        posterImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 2).isActive = true
        posterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        posterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        posterDescription.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 32).isActive = true
        posterDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        posterDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true

    }
}
