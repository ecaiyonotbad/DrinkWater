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
    @IBOutlet weak var setButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    @IBAction func setButtonPressed(_ sender: UIButton) {
        defaults.set(textField.text, forKey: Keys.endTime)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let endHR = dateFormatter.string(from: picker.date)
        let endHRInt = Int(endHR)
        defaults.set(endHRInt,forKey: "endHR")

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
        setUpStyle()
        
    }
    
    func loadTextField () {
        textField.text = defaults.string(forKey: Keys.endTime)
    }
    
    func createPicker () {
        picker.datePickerMode = .time
        textField.inputView = picker
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
    }
    
    func setUpButton () {
        setButton.layer.cornerRadius = 25.0
        setButton.layer.borderColor = UIColor.darkGray.cgColor
        setButton.layer.borderWidth = 2
        setButton.tintColor = UIColor.darkGray
    }
    
    func setUpStyle() {
        setUpButton()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "026 Saint Petersburg"))
        messageLabel.textColor = .darkGray
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }

    
}

extension NotificationEndTimeVC : UIPickerViewDelegate  {
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    
}
