//
//  Settings.swift
//  race
//
//  Created by Eugene sch on 8/24/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation


class Settings: Codable {
    
    var name: String?
    var carImageNum: Int = CarColor.red.rawValue
    var spartSpeed: Int = 1
    var volume: Float = 50
    var volumeOn = true
    
    private enum CodingKeys: String, CodingKey {
        case name
        case carImageNum
        case spartSpeed
        case volume
        case volumeOn
    }
    
    init(){}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        carImageNum = try container.decodeIfPresent(Int.self, forKey: .carImageNum) ?? CarColor.red.rawValue
        spartSpeed = try container.decodeIfPresent(Int.self, forKey: .spartSpeed) ?? 1
        volume = try container.decodeIfPresent(Float.self, forKey: .volume) ?? 50
        volumeOn = try container.decodeIfPresent(Bool.self, forKey: .volumeOn) ?? true
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.carImageNum, forKey: .carImageNum)
        try container.encode(self.spartSpeed, forKey: .spartSpeed)
        try container.encode(self.volume, forKey: .volume)
        try container.encode(self.volumeOn, forKey: .volumeOn)
    }

}
