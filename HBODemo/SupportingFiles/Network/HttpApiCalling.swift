//
//  Created by Essam Orabi on 01/01/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Resource<T: Codable> {
    var url: String
    var httpMethod: HTTPMethod
    var parameters:Parameters
    var header:HTTPHeaders
    
}

class HttpApiCallingWithRep{
    class func requestWithBody<T>
    (resource:Resource<T>, Result:@escaping(_ result :T?,_ responseCode : Int , _ errorMessage : String?,_ ErrorResponse:ResponseModel?)->()) {
        
        var EncodType : ParameterEncoding =  URLEncoding.default
        if resource.httpMethod == .get
        {
            EncodType = URLEncoding.default
        } else if resource.httpMethod == .delete
        {
            EncodType = JSONEncoding.default
        }
        else if resource.httpMethod == .post {
            EncodType = JSONEncoding.default
        }
        let loadview = Loading()
        DispatchQueue.main.async {
            loadview.loading()
        }
        print(resource.url)
        AF.request(resource.url , method: resource.httpMethod, parameters: resource.parameters, encoding:EncodType ,headers: resource.header)
            .responseJSON { (response) in
                debugPrint(response)
                print("d",JSON(response.data as Any))
                print("r",JSON(response.result as Any))
                DispatchQueue.main.async {
                    loadview.stopAnimating()
                }
                // nil response
                if response.response == nil {
                    Result(nil ,statusCode.NOT_FOUND , "Connection Error",nil)
                    return
                }

                /// have reponse 200
                if response.response!.statusCode == statusCode.OK {
                    let JSONResult = response.data
                    let jsonObject = JSON(JSONResult as Any)

                    guard let Object = CodableHandler.decodeClass(T.self, classJsonData:jsonObject) as? T else {return}
                    Result(Object , statusCode.OK , "Success",nil)

                    /// error server 500
                }else if response.response!.statusCode == statusCode.BAD_GATEWAY || response.response!.statusCode == statusCode.SERVICE_UNAVAILABLE{
                    Result(nil ,response.response!.statusCode , "Server Error",nil)
                    return
                    // custom error 401
                } else if response.response!.statusCode == statusCode.UNAuthoried{
                    Result(nil ,response.response!.statusCode , "Un authoried",nil)
                    return
                    // custom error 400
                } else {
                    Result(nil ,response.response!.statusCode , "Bad Request",nil)
                }
            }
    }
}

