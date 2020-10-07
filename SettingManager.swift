//
//  SettingManager.swift
//  race
//
//  Created by Eugene sch on 8/23/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import Foundation


class SettingManager {
    static let shared  = SettingManager()
    
    private init() {
        guard let setting = UserDefaults.standard.value(Settings.self, forKey: "Settings") else {
            self.data = Settings()
            return
        }
        self.data = setting
    }
   
    var data: Settings
    
    func save(){
        UserDefaults.standard.set(encodable: data, forKey: "Settings")
    }
    
}
