//
//  ViewController.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var otpView: VPMOTPView!
    
    @IBOutlet weak var lblMessage: UILabel!
    var enteredOtp: String = "54321"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        otpView.otpFieldsCount = 5
        otpView.otpFieldDefaultBorderColor = UIColor.blue
        otpView.otpFieldEnteredBorderColor = UIColor.green
        otpView.otpFieldErrorBorderColor = UIColor.red
        otpView.otpFieldBorderWidth = 2
        otpView.delegate = self
        otpView.shouldAllowIntermediateEditing = false
        
        // Create the UI
        otpView.initializeUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: VPMOTPViewDelegate {
    func hasEnteredAllOTP(hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        
        return enteredOtp == "12345"
    }
    
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otpString: String) {
        
        if enteredOtp == otpString {
            print("OTPString: \(otpString)")
            lblMessage.text = "Welcome"
            lblMessage.textColor = UIColor.green
            
        }
        else
        {
            lblMessage.text = "Wrong Password!!! Please try again."
            lblMessage.textColor = UIColor.red
        }
        
    }
}
