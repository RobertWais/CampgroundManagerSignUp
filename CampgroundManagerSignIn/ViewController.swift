//
//  ViewController.swift
//  CampgroundManagerSignIn
//
//  Created by Robert Wais on 3/9/18.
//  Copyright © 2018 Robert Wais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userTextView: UITextField!
    @IBOutlet var passwordTextView: UITextField!
    @IBOutlet var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn.layer.borderColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.cornerRadius=signInBtn.layer.bounds.height/2
        userTextView.textColor = UIColor.white
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInBtnPressed(_ sender: Any) {
        if userTextView.text != nil && passwordTextView.text != nil{
            AuthService.instance.registerUser(email: userTextView.text!, password: passwordTextView.text!, complete: { (success, error)  in
                if success {
                    let alert = UIAlertController(title: "User Added", message: "They are an employee", preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                    alert.addAction(cancel)
                    self.present(alert,animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error",
                                                  message: (error?.localizedDescription)!,
                                                  preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                    alert.addAction(cancel)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
}

