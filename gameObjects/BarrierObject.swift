//
//  BarrierObject.swift
//  race_sssr
//
//  Created by Eugene sch on 8/17/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation

import UIKit

let elements = ["Taxi", "Police car", "White van", "Van rundown", "Truck", "Truck white", "Street baracade 2"]

class BarrierObject: RaceObject {
    
    override func size() -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override func contactWithCar(){
        Manager.shared.stopGame()
        view?.isHidden = true
    }

    override func getImage(position: Int) -> UIImage {
        return UIImage(named: elements.randomElement() ??   "") ?? UIImage()
    }
}
