//
//  ViewController.swift
//  Registration Form
//
//  Created by David Daniel Leah (BFS EUROPE) on 04/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 
    
    @IBOutlet weak var firstN: UITextField!
    @IBOutlet weak var lastN: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var telephone: UITextField!
    
    @IBAction func registerMe(_ sender: Any) {
        print(firstN.text!);
        print(lastN.text!);
        print(dob.text!);
        print(gender.titleForSegment(at: gender.selectedSegmentIndex)!);
        print(telephone.text!);
    }
    
    @IBAction func showDetails(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set image in backgorund
        
        self.view.addBackground()
        
        dob.delegate = self;
        dob.keyboardType = .numberPad;
        telephone.keyboardType = .numberPad;
        //gesture recognizer : dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        if ((text.count == 2) || (text.count == 5)) && (string != ""  ) {
            textField.text = text + "/";
        }
        let length = textField.text!.utf16.count + string.utf16.count - range.length
        
        return length <= 10
    }
    
    
    @objc func textFieldChanged(textField: UITextField) {
        
    }
    
    @objc func hideKeyboard() {
        firstN.resignFirstResponder()
        lastN.resignFirstResponder()
        dob.resignFirstResponder()
        telephone.resignFirstResponder()
        email.resignFirstResponder()
    }
    


}

