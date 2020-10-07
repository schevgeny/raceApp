//
//  SpeedUp.swift
//  race_sssr
//
//  Created by Eugene sch on 8/17/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit


class SpeedUp: RaceObject {
    
    override func size() -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    override func contactWithCar(){
        Manager.shared.speedUp()
        view?.isHidden = true
    }

    override func getImage(position: Int) -> UIImage {
        guard let image = UIImage(named: "Oil can") else {
            return UIImage()
        }
        return image
    }
}
