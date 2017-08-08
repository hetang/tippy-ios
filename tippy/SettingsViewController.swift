//
//  SettingsViewController.swift
//  tippy
//
//  Created by Hetang.Shah on 8/7/17.
//  Copyright © 2017 rah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_index")
        tipSegment.selectedSegmentIndex = intValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setTransparantNavigation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
    }
    
    func setGradientBackground() {
        let colorBottom =  UIColor(red: 228.0/255.0, green: 244.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        let colorTop = UIColor(red: 75.0/255.0, green: 187.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setTransparantNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
}
