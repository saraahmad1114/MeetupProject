//
//  ViewController.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/25/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var zipCodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
       self.view.backgroundColor = UIColor.white
       self.navigationController?.navigationBar.topItem?.title = "FIND NEARBY MEETUP EVENTS"
       self.navigationController?.navigationBar.barTintColor = UIColor.red
       self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
       self.zipCodeTextField = UITextField(frame: CGRect(x: 100.00, y: 100.00, width: 300.00, height: 30.00))
       self.zipCodeTextField.textColor = UIColor.blue
       self.zipCodeTextField.center = self.view.center
       self.zipCodeTextField.placeholder = "PLACE ZIPCODE HERE"
       self.zipCodeTextField.backgroundColor = UIColor.red
       self.zipCodeTextField.borderStyle = UITextBorderStyle.roundedRect
       self.zipCodeTextField.clearsOnBeginEditing = true
       self.view.addSubview(self.zipCodeTextField)
    
       self.zipCodeTextField.translatesAutoresizingMaskIntoConstraints = false
       self.zipCodeTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIScreen.main.bounds.height * 0.04).isActive = true
       self.zipCodeTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let zipButton: UIButton = UIButton(frame: CGRect(x: 100.00, y: 100.00, width: 300.00, height: 30.00))
        zipButton.backgroundColor = UIColor.red
        zipButton.setTitle("FIND EVENTS WITH ZIPCODE", for: UIControlState.normal)
        zipButton.addTarget(self, action: #selector(zipCodeAction(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(zipButton)
        
        zipButton.translatesAutoresizingMaskIntoConstraints = false
        zipButton.topAnchor.constraint(equalTo: self.zipCodeTextField.bottomAnchor, constant: UIScreen.main.bounds.height * 0.04).isActive = true
        zipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

//        let timeInterval = Double (1485600300000)
//        let date = NSDate(timeIntervalSince1970: timeInterval/1000.0)
//        print("**********************")
//        print(date)
//        print("**********************")
    }
    
    
    func isZipCodeValid(text: String) -> Bool {
        let zipCodeTestPredicate = NSPredicate (format:"SELF MATCHES %@","(^[0-9]{5}(-[0-9]{4})?$)")
        return zipCodeTestPredicate.evaluate(with: zipCodeTextField.text)
    }
    
    
    func zipCodeAction(sender: UIButton!) {
        //zipcode Button stuff
        if let zipcodeText = self.zipCodeTextField.text {
        if isZipCodeValid(text: zipcodeText) == true
        {
            
            let destVC = MeetupEventsDisplayTableViewController()
            destVC.zipCodeCatch = zipcodeText
            
            navigationController?.pushViewController(destVC, animated: false)
            print("user entered valid zipCode")
        }
            
        else
        {
            //create the alert
            let alert = UIAlertController(title: "Invalid Zipcode", message: "Enter Valid Zipcode", preferredStyle: UIAlertControllerStyle.alert)
            //add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //show the alert
            self.present(alert, animated: true, completion: nil)
        }
    
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MeetupEventsDisplayTableViewController{
            if let zipCodeText = self.zipCodeTextField.text {
                destinationVC.zipCodeCatch = zipCodeText
            }
        }
    }
    
  
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

