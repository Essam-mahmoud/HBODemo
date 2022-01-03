//
//  Ex+Images.swift
//
//  Created by Essam Orabi on 20/09/2021.
//

import UIKit
import Kingfisher

extension UIImageView {

    func loadImageFromUrl (imgUrl : String?,defString:String = "placeholder") {
        DispatchQueue.main.async() {

            let defualtImage = UIImage(named: defString)
            if imgUrl == "" || imgUrl == nil
            {
                self.image = defualtImage
                return

            }
            let encoding : String = imgUrl?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            guard let url = URL(string: encoding ) else {
                self.image = defualtImage
                return
            }
            let processor = DownsamplingImageProcessor(size: self.frame.size)
                |> RoundCornerImageProcessor(cornerRadius: 0)
            self.kf.indicatorType = .activity
            DispatchQueue.main.async() {
                self.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: defString),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                self.layer.masksToBounds = true
            }
        }
    }
}

