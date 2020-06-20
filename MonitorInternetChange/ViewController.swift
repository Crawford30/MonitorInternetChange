//
//  ViewController.swift
//  MonitorInternetChange
//
//  Created by JOEL CRAWFORD on 6/20/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.

//Monitor change in internet

//ios 12  below we use reachability class to detect
//ios 12 and above use Network framework

import UIKit
import Network

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        //==============================
        
        monitorNetwork()
        
        
    }
    
    func monitorNetwork() {
        //NWPathMonitor(requiredInterfaceType: .cellular)  when only lookin for cellular
        
        let monitor = NWPathMonitor() //since a phone can be on wifi or cellular we leave parameter empty
        
        monitor.pathUpdateHandler = {
            
            path in
            
            if path.status == .satisfied { //means we are connected to internet
                
                //since we are using dispatch queue
                
                DispatchQueue.main.async {
                    
                    self.lblTitle.text = "Internet Connected"
                    
                    self.view.backgroundColor = .systemGreen
                    
                    
                }
                
                
            } else {
                
                DispatchQueue.main.async {
                    
                    self.lblTitle.text = "No Internet"
                    
                    self.view.backgroundColor = .systemRed
                    
                }
                
            }
            
        }
        
        
        //Adding meter star
        
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        
    }
    
    
    
    
}

