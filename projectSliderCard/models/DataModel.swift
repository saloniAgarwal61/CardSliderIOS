//
//  DataModel.swift
//  projectSliderCard
//
//  Created by Saloni Agarwal on 19/06/21.
//

import Foundation


struct DataModel : Codable {
    let data : [DataItem]?
   

    enum CodingKeys: String, CodingKey {
        case data = "data"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([DataItem].self, forKey: .data)
       
    }
}

struct DataItem : Codable {

    let id : String?
    let text : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case text = "text"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }
}




