//
//  APIManager.swift
//  projectSliderCard
//
//  Created by Saloni Agarwal on 19/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON


import KRProgressHUD
class APIManager {
    static let shared = APIManager()
    let jsonDecoder = JSONDecoder()
    
    
    func getData(completionHandler:@escaping(_ response:[DataItem]?)->()){
        KRProgressHUD.show()
        
        WebService.shared.apiMethodWithoutParam(urlComponent: Constant.baseUrl, httpMethod: HttpMethod.get){ (responseData, responseError) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                guard let data = responseData else{return}
                do {
                   
                    let responseModel  = try self.jsonDecoder.decode(DataModel.self, from: data)
                    completionHandler(responseModel.data ?? [])
                    
//                    let responseModel : [DataItem] = try decoder.decode([DataItem].self, from: data)
//                    completionHandler(responseModel ?? [])
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    

    
}
