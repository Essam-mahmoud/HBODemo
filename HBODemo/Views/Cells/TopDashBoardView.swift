//
//  TopDashBoardView.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import UIKit

class TopDashBoardView: UIView {

    let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let BackGroundimage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "poster")
        return imageView
    }()


    func addGradiantEffect() {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }

    func setConstrains() {
        let playConstraint = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]

        let downloadConstraint = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]

        NSLayoutConstraint.activate(playConstraint)
        NSLayoutConstraint.activate(downloadConstraint)

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(BackGroundimage)
        addGradiantEffect()
        addSubview(playButton)
        addSubview(downloadButton)
        setConstrains()


    }

    override func layoutSubviews() {
        super.layoutSubviews()
        BackGroundimage.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
