//
//  ViewController.swift
//  tippy
//
//  Created by Hetang.Shah on 8/7/17.
//  Copyright © 2017 rah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var selectedTip: UISegmentedControl!
    
    let formatter = NumberFormatter()
    let tipPercentages = [0.18,0.2,0.25]
    var deafultTip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_index")
        selectedTip.selectedSegmentIndex = intValue
        deafultTip = intValue
        
        setGradientBackground()
        setTransparantNavigation()
    
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_index")
        print ("deafultTip = \(deafultTip) and intValue = \(intValue)")
        
        if (deafultTip != intValue) {
            deafultTip = intValue
            selectedTip.selectedSegmentIndex = intValue
            calculateTip(animated)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dissmissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[selectedTip.selectedSegmentIndex]
        let total = bill + tip
        let tipFormatted = formatter.string(for: tip)
        let totalFormatted = formatter.string(for: total)
        
        tipLabel.text = "$" + tipFormatted!
        totalLabel.text = "$" + totalFormatted!
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

