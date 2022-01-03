//
//  MainCategoriesTableCell.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import UIKit

class MainCategoriesTableCell: UITableViewCell {
    static let identifier = "MainCategoriesTableCell"
    @IBOutlet weak var filmsCollectionView: UICollectionView!
    var movieSelected: ((Int) -> Void)?
    var moviesData = [Movie]()

    override func awakeFromNib() {
        filmsCollectionView.delegate = self
        filmsCollectionView.dataSource = self
        filmsCollectionView.register(UINib(nibName: FilmsCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: FilmsCollectionCell.identifier)
    }

    func setupCell(data: [Movie]) {
        moviesData = data
        filmsCollectionView.reloadData()
    }
}

extension MainCategoriesTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmsCollectionCell.identifier, for: indexPath) as? FilmsCollectionCell else {return UICollectionViewCell()}
        cell.setupCell(data: moviesData[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        movieSelected?(indexPath.row)
    }
}
