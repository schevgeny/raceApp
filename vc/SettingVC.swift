//
//  SettingVC.swift
//  race
//
//  Created by Eugene sch on 8/23/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var image: UIImageView?
    @IBOutlet weak var speedSlider: UISlider?
    @IBOutlet weak var musicOn: UISwitch?
    @IBOutlet weak var volumeSlider: UISlider?
    
    
    var currentImageNumber = 0
    
    let imagesArray = [
        CarColor.red.image,
        CarColor.blue.image,
        CarColor.yellow.image,
        CarColor.grey.image,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let setting = SettingManager.shared.data
        currentImageNumber = setting.carImageNum
        nameTextField?.text = setting.name
        speedSlider?.value = Float(setting.spartSpeed)
        image?.image = UIImage(named: imagesArray[currentImageNumber])
        musicOn?.isOn = setting.volumeOn
        volumeSlider?.value = setting.volume
    }

    
    //MARK: IBAction
    @IBAction func leftAction(_ sender: UIButton) {
        if currentImageNumber  == 0 {
            currentImageNumber = imagesArray.count
        }
        currentImageNumber -= 1
        
        showImage(shift: -view.frame.size.width)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        currentImageNumber += 1
        if currentImageNumber == imagesArray.count {
            currentImageNumber = 0
        }
        showImage(shift: view.frame.size.width)
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        SettingManager.shared.data.carImageNum = currentImageNumber
        SettingManager.shared.data.spartSpeed = Int(speedSlider?.value ?? 1)
        SettingManager.shared.data.volume = volumeSlider?.value ?? 50
        SettingManager.shared.data.volumeOn = musicOn?.isOn ?? true
        SettingManager.shared.data.name = nameTextField?.text
        SettingManager.shared.save()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func showImage(shift: CGFloat){
        guard let image = self.image else { return }
        let newView = UIImageView()
        newView.image = UIImage(named: imagesArray[currentImageNumber])
        newView.frame = image.frame
        newView.frame.origin.x += shift
        newView.contentMode = image.contentMode
        
        view.addSubview(newView)
        
        UIView.animate(withDuration: 1, animations: {
            newView.frame = image.frame
        },completion: { (_) in
            image.image = newView.image
            newView.removeFromSuperview()
        })
    }

}
