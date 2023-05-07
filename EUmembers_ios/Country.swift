//
//  Country.swift
//  EUmembers_ios
//
//  Created by jingjing yang on 3.5.2023.
//

import Foundation

//The Codable protocol is used to allow instances of the Country struct to be encoded and decoded to and from JSON.
//The Identifiable protocol is used to provide a unique identifier for each instance of the Country struct.
struct Country: Codable, Identifiable{
    var id = UUID()

    var code: String // 2-letter country code
    var name: String // country name

    var area: Int // land area (square kilometers)
    var population: Int // population
    var populationDensity: Int { // population density (people per square kilometer)
            return self.population / self.area
        }

    var isMember: Bool // is the country a member of the EU
    var isEuroZone: Bool // is the country a member of the Eurozone
    var isSchengen: Bool // is the country a member of the Schengen Area
        
//    The enum CodingKeys is used to specify the keys that should be used when encoding and decoding instances of the Country struct.
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case area
        case population
        case isMember
        case isEuroZone
        case isSchengen
    }
}
