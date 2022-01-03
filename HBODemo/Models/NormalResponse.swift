
//  Choco-hire
//
//  Created by Essam Orabi on 20/09/2021.
//

import Foundation

class ResponseModel : Codable {
    let message : String?
    let code : Int?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case code = "code"
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        
    }
}




