//
//  ViewController.swift
//  tips
//
//  Created by Lawrence Chong on 1/1/16.
//  Copyright (c) 2016 Lawrence Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTipField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        customTipField.text = "--"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPercent = [0.18, 0.2, 0.22]
        var tipAmt = tipPercent[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipAmt
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onSegmentedTIpPress(sender: AnyObject) {
        customTipField.text = "--"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onCustomTipChange(sender: AnyObject) {
        tipControl.selectedSegmentIndex = -1
        var customtip = NSString(string: customTipField.text!).doubleValue
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * (customtip/100)
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onCustomTipTouch(sender: AnyObject) {
        customTipField.text = ""
    }
}

