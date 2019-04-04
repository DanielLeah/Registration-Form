//
//  ViewController.swift
//  Registration Form
//
//  Created by David Daniel Leah (BFS EUROPE) on 04/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set image in backgorund
        
        self.view.addBackground()
        
        firstN.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.5)
        
        
        dob.delegate = self;
        dob.keyboardType = .numberPad;
        telephone.keyboardType = .numberPad;
        //gesture recognizer : dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        self.view.addGestureRecognizer(tapGesture)
    }
    //MARK: OUTLETS AND ACTIONS
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
        
        updateCoreData()
    }
    
    @IBAction func showDetails(_ sender: Any) {
    }
    
    
    
    
    // MARK: Text Fields Delegate
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
    
    //MARK: CORE DATA

    func updateCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        
        let users = NSEntityDescription.entity(forEntityName: "Users", in: context)!
        let user = NSManagedObject(entity: users, insertInto: context)
        user.setValue(firstN.text!, forKey: "firstName")
        user.setValue(lastN.text!, forKey: "lastName")
        user.setValue(email.text!, forKey: "email")
        user.setValue(telephone.text!, forKey: "telephone")
        user.setValue(dob.text!, forKey: "dateOfBirth")
        user.setValue(gender.titleForSegment(at: gender.selectedSegmentIndex)!, forKey: "gender")
        
        
        do{
            try context.save()
            print("Saved")
        }catch let error as NSError {
            print("Error! Could not save. \(error)")
        }
    }
}

