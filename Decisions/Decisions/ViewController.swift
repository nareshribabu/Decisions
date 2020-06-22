//
//  ViewController.swift
//  Decisions
//
//  Created by Nareshri Babu on 2020-06-01.
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var start_button: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start_button.layer.cornerRadius = 10
        clear.layer.cornerRadius = 10
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        //locks rotation
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    //disables lock rotation after view is gone
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Don't forget to reset when view is being removed
        AppDelegate.AppUtility.lockOrientation(.all)
    }

    func selectNumber() -> Int {
        
        var number = 0;
        
        //1,2,3,4
        if textfield1.text != "" && textfield2.text != "" && textfield3.text != "" && textfield4.text != "" {
            number = Int.random(in: 1...4)
        }
        //1,2,3
        else if textfield1.text != "" && textfield2.text != "" && textfield3.text != "" {
            number = Int.random(in: 1...3)
        }
        //2,3,4
        else if textfield2.text != "" && textfield3.text != "" && textfield4.text != "" {
            number = Int.random(in: 2...4)
        }
        //1,3,4
        else if textfield1.text != "" && textfield3.text != "" && textfield4.text != "" {
            let array = [1,3,4]
            
            number = array.randomElement() ?? 1
        }
         
        //1,2,4
        else if textfield1.text != "" && textfield2.text != "" && textfield4.text != "" {
            let array = [1,2,4]
            
            number = array.randomElement() ?? 1
        }
            
        
            
        //1,2
        else if textfield1.text != "" && textfield2.text != "" {
            number = Int.random(in: 1...2)
        }
        //2,3
        else if textfield2.text != "" && textfield3.text != "" {
            number = Int.random(in: 2...3)
        }
        //3,4
        else if textfield3.text != "" && textfield4.text != "" {
            number = Int.random(in: 3...4)
        }
        
        //2,4
        else if textfield2.text != "" && textfield4.text != "" {
            let array = [2,4]
            
            number = array.randomElement() ?? 2
        }
        
        //1,4
        else if textfield1.text != "" && textfield4.text != "" {
            let array = [1,4]
            
            number = array.randomElement() ?? 4
        }
        
        //1,3
        else if textfield1.text != "" && textfield3.text != "" {
            let array = [1,3]
            
            number = array.randomElement() ?? 1
        }

        
        
        
        return number;
    }
    
    @IBAction func start_button(_ sender: UIButton) {
        
        let number = selectNumber()
        
        if number == 1 {
            label.text = textfield1.text;
        }
        if number == 2 {
            label.text = textfield2.text;
        }
        if number == 3 {
            label.text = textfield3.text;
        }
        if number == 4 {
            label.text = textfield4.text;
        }
        
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        
        textfield1.text = ""
        textfield2.text = ""
        textfield3.text = ""
        textfield4.text = ""
        
        label.text = "Let's Make Decisions!"
        
    }
    

}

