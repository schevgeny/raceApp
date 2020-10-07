//
//  ViewController.swift
//  race
//
//  Created by Eugene sch on 8/20/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView?.addParalaxEffect()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageView?.addParalaxEffect()
    }

    @IBAction func playAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: RaceVC.className) as? RaceVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: SettingVC.className) as? SettingVC else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

