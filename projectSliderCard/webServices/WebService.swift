//
//  WebService.swift
//  projectSliderCard
//
//  Created by Saloni Agarwal on 19/06/21.
//

import Foundation

import Alamofire
import SwiftyJSON
class WebService {
    
    static let shared = WebService()
    
    /// API method without parameters
    func apiMethodWithoutParam(urlComponent:String,httpMethod:String, completion:@escaping (_ data: Data?, _ error: NSError?) -> Void){
        
        
       
            print(" ================== API LOG ==================")
            
            print("URL : \(urlComponent)")
           
            
            print(" ================== API LOG ==================")
            
            let session = URLSession.shared
            let url = URL(string:urlComponent)!
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
            let task = session.dataTask(with: request) { data, response, error in
                
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    //used to remove "/" from json
                    
                    let dataStringNew = dataString
                    let newData = Data(dataStringNew.replacingOccurrences(of: "/", with: "").utf8)
                    
                    completion(newData,nil)
                    
                  
                }
                
                if error != nil || data == nil {
                    
                    
                    print("Client error!")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        
    }
}
    


extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

