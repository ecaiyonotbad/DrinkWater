//
//  NotificationEndTimeVC.swift
//  DrinkWater
//
//  Created by Edward Chen on 2019-12-31.
//  Copyright © 2019 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class NotificationEndTimeVC : UIViewController {
    
    struct Keys {
        static let endTime = "endTime"
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        defaults.set(textField.text, forKey: Keys.endTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        
    }
    var picker = UIDatePicker()
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let myString = dateFormatter.string(from: picker.date)
        textField.text = myString
    }
    

    
    func setUp() {
        createPicker()
        createTap()
        loadTextField()
        
    }
    
    func loadTextField () {
        textField.text = defaults.string(forKey: Keys.endTime)
    }
    
    func createPicker () {
        picker.datePickerMode = .time
        textField.inputView = picker
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
}

extension NotificationEndTimeVC : UIPickerViewDelegate  {
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    
}
