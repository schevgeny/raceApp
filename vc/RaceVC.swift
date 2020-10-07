//
//  RaceVC.swift
//  race
//
//  Created by Eugene sch on 8/20/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

class RaceVC: UIViewController {

    @IBOutlet weak var carImage: UIImageView?
    @IBOutlet weak var resultLabel: UILabel?
    @IBOutlet weak var displayView: UIView?
    @IBOutlet weak var speedLabel: UILabel?
    
    var timer: Timer?
    var isSetBarer = false
    var car: CarObject?
    
    
    
    @IBAction func leftAction(_ sender: Any) {
        self.car?.moveLeft()
    }
    @IBAction func rightAction(_ sender: Any) {
        self.car?.moveRight()
    }
    @IBAction func speedDown(_ sender: Any) {
        Manager.shared.speedDown()
    }
    @IBAction func speedUp(_ sender: Any) {
        Manager.shared.speedUp()
    }
    @IBAction func shake() {
      
    }
    
    
    @IBAction func pauseAction(_ sender: Any) {
        if Manager.shared.timer == nil {
            startGame()
        } else {
            Manager.shared.timer?.invalidate()
            Manager.shared.timer = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.becomeFirstResponder()
        startGame()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            self.setCarImage(num: Int.random(in: 0...CarColor.allCases.count))
        }
    }
    
    
    @objc func gameStep() {
        Manager.shared.result += 1
        self.resultLabel?.text = String(Manager.shared.result)
        
        if Manager.shared.result % 10 == 0 {
//            Manager.shared.speedUp()
        }
        speedLabel?.text = Manager.shared.speedLvl()
        self.addObjects()
        
    }
    
    @objc func backgraundStep() {
        RoadLineObject().add(to: 0)
        RoadLineObject().add(to: 1)
        RoadLineObject().add(to: 2)
        RoadLineObject().add(to: 3)
    }
    
    private func timerStop(){
        self.timer?.invalidate()
        self.timer = nil
    }
    
    private func addObject(object: RaceObject?) {
        guard let object = object else { return }
        
        if let addView = object.view {
             displayView?.addSubview(addView)
        }
        object.move()
    }
    
    func startGame() {
        Manager.shared.displayView = displayView
        self.backgraundStep()

        self.setCarImage(num: SettingManager.shared.data.carImageNum)
        self.car = CarObject(view: self.carImage, displayView: self.displayView)
        self.car?.startPosition()
        
        Manager.shared.gameStart()
        
        Manager.shared.timer = Timer.scheduledTimer(timeInterval: Manager.shared.speed, target: self, selector: #selector(gameStep), userInfo: nil, repeats: true)
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.showResultPage()
        }
        speedLabel?.text = Manager.shared.speedLvl()
    }
    
    private func setCarImage(num: Int) {
        carImage?.image = UIImage(named: CarColor(rawValue: num)?.image ?? CarColor.red.image) //SettingManager.shared.carImageName
    }
    
    //MARK: private func
    private func showResultPage() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else { return }
        if Manager.shared.isStop == true {
            vc.result = String(Manager.shared.result)
            timerStop()
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    private func addObjects() {
        isSetBarer = !isSetBarer
        if isSetBarer {
            return
        }
   
        switch Int.random(in: 0...10) {
        case 0:
            SpeedDownObject().add()
        case 1...2:
            SpeedUp().add()
        default:
            BarrierObject().add()
        }
       
  

    }

}
