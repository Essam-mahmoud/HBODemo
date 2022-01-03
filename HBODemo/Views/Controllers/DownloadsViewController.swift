//
//  DownloadsViewController.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import UIKit

class DownloadsViewController: UIViewController {

    let comingSoonlabel: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigation()
        view.addSubview(comingSoonlabel)
        comingSoonLabelConstraints()

    }

    func setupNavigation() {
        var image = UIImage(named: "hbo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    func comingSoonLabelConstraints() {
        comingSoonlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        comingSoonlabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
}
