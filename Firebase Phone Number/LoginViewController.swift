//
//  ViewController.swift
//  Firebase Phone Number
//
//  Created by Pratik Gavit on 10/02/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController, UIGestureRecognizerDelegate {
    let auth = Auth.auth()
    var verificationID:String? = nil
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var txtOtp: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //when you are submitting phone number otp should be hidden
        txtOtp.isHidden = true
        btnLogIn.setTitle("Get OTP", for: .normal)
        txtPhoneNo.text = ""
        txtOtp.text = ""
        
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        //By checking if otp is hidden you are sending otp request only if it is not send already
        
        if txtOtp.isHidden {
            auth.settings?.isAppVerificationDisabledForTesting = false
            PhoneAuthProvider.provider().verifyPhoneNumber(txtPhoneNo.text!, uiDelegate: nil) { verificationId, error in
                if error != nil {
                    return
                } else{
                    self.verificationID = verificationId
                    //once you get verification id you unable OTP
                    self.btnLogIn.setTitle("Sign In", for: .normal)
                    self.txtOtp.isHidden = false
                    
                }
            }
        } else {
            if (verificationID != nil) {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: txtOtp.text ?? "")
                auth.signIn(with: credential) {authData, error in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else{
                        //let uid = authData?.user.uid
                        
                        print("Authorization Success")
                        //If authorization is succcesfull you will be opening news homepage directly
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        self.performSegue(withIdentifier: "toNext", sender: nil)
                        self.navigationController?.isNavigationBarHidden = false
                    }
                }
            } else{
                print("Error in getting otp")
            }
        }
        
    }
    
    
}

