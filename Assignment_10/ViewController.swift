//
//  ViewController.swift
//  Assignment_10
//
//  Created by Macbook Air 13 on 23.10.23.
//
//  ----- iPhone 14 Pro used as a simulator -----
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var firstNumberTF: UITextField!
    @IBOutlet weak var secondNumberTF: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        modeLabel.text = "Least Common Multiple"
        modeSwitch.setOn(false, animated: false)
        calculateButton.setTitle("Calculate", for: .normal)
        resultLabel.text = ""
    }
    
    // MARK: - IBActions
    // Switch is changed from LCM to GCD:
    @IBAction func switchChanged(_ sender: Any) {
        if modeSwitch.isOn {
            modeLabel.text = "Greatest Common Divisor"
        } else {
            modeLabel.text = "Least Common Multiple"
        }
    }
    
    // Calculate button is clicked by user:
    @IBAction func calculateClicked(_ sender: Any) {
        // If both texts can be casted to Int:
        if let first = Int(firstNumberTF.text ?? ""), let second = Int(secondNumberTF.text ?? "") {
            // Setting both textfield colors to white:
            firstNumberTF.backgroundColor = .white
            secondNumberTF.backgroundColor = .white
            
            // Calculating GCD:
            if modeSwitch.isOn {
                resultLabel.text = "GCD(\(first), \(second)) = \(gcd(first, second))"
            // Calculating LCM:
            } else {
                resultLabel.text = "LCM(\(first), \(second)) = \(lcm(first, second))"
            }
        // If any of textfields can NOT be casted to Int:
        } else {
            // if first textfield is not castable:
            if Int(firstNumberTF.text ?? "") == nil {
                firstNumberTF.backgroundColor = .red
            } else {
                firstNumberTF.backgroundColor = .white
            }
            
            // if second textfield is not castable:
            if Int(secondNumberTF.text ?? "") == nil {
                secondNumberTF.backgroundColor = .red
            } else {
                secondNumberTF.backgroundColor = .white
            }
        }
    }
    
    // MARK: - Methods
    // Private method for calculating Greatest Common Divisor:
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var dividend = 0
        var divisor = max(a, b)
        var remainder = min(a, b)

        while remainder != 0 {
            dividend = divisor
            divisor = remainder
            remainder = dividend % divisor
        }
        return divisor
    }
    
    // Private method for calculating Least Common Divisor:
    private func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }
}
