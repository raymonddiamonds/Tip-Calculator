//
//  ViewController.swift
//  TipPro
//
//  Created by Raymond Diamonds on 2017-06-21.
//  Copyright © 2017 Raymond Diamonds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func calculateTip(_ sender: Any) {
            if let billAmount = Double(billAmountField.text!) {
                var tipPercentage = 0.0
                
                switch tipSelector.selectedSegmentIndex {
                case 0:
                    tipPercentage = 0.15
                case 1:
                    tipPercentage = 0.18
                case 2:
                    tipPercentage = 0.20
                default:
                    break
                }
                
                let roundedBillAmount = round(100 * billAmount) / 100
                let tipAmount = roundedBillAmount * tipPercentage
                let roundedTipAmount = round(100*tipAmount)/100
                let totalAmount = roundedBillAmount + roundedTipAmount
                
                if (!billAmountField.isEditing) {
                    billAmountField.text = String(format: "%.2f", roundedBillAmount)
                }
                tipAmountField.text = String(format: "%.2f", roundedTipAmount)
                totalAmountField.text = String(format: "%.2f", totalAmount)
            } else {
                //show error
                billAmountField.text = ""
                tipAmountField.text = ""
                totalAmountField.text = ""
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }


    }
