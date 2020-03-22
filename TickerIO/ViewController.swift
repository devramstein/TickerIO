//
//  ViewController.swift
//  TickerIO
//
//  Created by Mac Fusion on 8/24/19.
//  Copyright © 2019 Mac Fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var timer = Timer()
    @IBOutlet weak var zuluLbl: UILabel!
    @IBOutlet weak var localLbl: UILabel!
    @IBOutlet weak var julianDate: UILabel!
    @IBOutlet weak var zuluJulianDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
       // let defaultTimeZoneStrLocal = formatterlocal.string(from: UTCDate)
        
      //  zuluLbl.text = defaultTimeZoneStr
        
        
      //  localLbl.text = defaultTimeZoneStrLocal
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)

        //Local Date
        let dateDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "'0'yyD"
        
        let dateResults = formatter.string(from: dateDate)
        julianDate.text = "Local Date: \(dateResults)"
        
        //Zulu Date
        
        let UTCDate = Date()
        let formatterUTC = DateFormatter()
        formatterUTC.dateFormat = "'0'yyD"
               
               
               
        formatterUTC.timeZone = TimeZone(identifier:"GMT")
               
        let defaultTimeZoneStr = formatterUTC.string(from: UTCDate)
        zuluJulianDate.text = "Zulu Date: \(defaultTimeZoneStr)"
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }

    @objc func tick() {
           //Time
           //Local Time
           let dateDate = Date()
           let formatter = DateFormatter()
           
           formatter.dateFormat = "HH:mm:ss"
           
           let timeResults = formatter.string(from: dateDate)
           localLbl.text = "\(timeResults)"
           
        //Zulu Time
           
               let UTCDate = Date()
               let formatterUTC = DateFormatter()
               formatterUTC.dateFormat = "HH:mm:ss"
               
               
               
               formatterUTC.timeZone = TimeZone(identifier:"GMT")
               
               let defaultTimeZoneStr = formatterUTC.string(from: UTCDate)
        zuluLbl.text = "\(defaultTimeZoneStr)"
        
       }

}

