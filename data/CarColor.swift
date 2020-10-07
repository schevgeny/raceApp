//
//  CarColor.swift
//  race
//
//  Created by Eugene sch on 8/24/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation

enum CarColor: Int, CaseIterable {
    case red = 0, blue, yellow, grey
    
    
    var image: String {
        get {
            switch self {
            case .red: return "Car red"
            case .blue: return "Car blue"
            case .yellow: return "Car yellow"
            case .grey: return "Car grey"
            }
        }
    }
}
