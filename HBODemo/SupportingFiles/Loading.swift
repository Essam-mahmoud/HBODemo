
//
//  Created by Essam Orabi on 20/09/2021.
//

import UIKit
import NVActivityIndicatorView
class Loading: UIViewController,NVActivityIndicatorViewable {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loading (){
        let size = CGSize(width: 30, height: 30)
        startAnimating(size, message: "", type: NVActivityIndicatorType.lineScale)
    }
}
