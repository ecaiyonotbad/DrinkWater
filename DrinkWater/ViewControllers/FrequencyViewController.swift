//
//  FrequencyViewController.swift
//  DrinkWater
//
//  Created by Edward Chen on 2020-01-04.
//  Copyright © 2020 Edward Chen. All rights reserved.
//

import Foundation
import UIKit

class FrquencyViewController : UIViewController {
    struct Keys {
        static let frequency = "frequency"
    }
    
    let defaults = UserDefaults.standard
    let pickerData = ["1","2","3","4"]
    let units = ["hours"]
    var selectedFrquency = "1"
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var setButton: UIButton!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        defaults.set(selectedFrquency, forKey: Keys.frequency)
        let ns = NotificationSender()
        ns.removeAllNotification()
        ns.addNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        createPicker()
        setUpStyle()
    }
    
    func setUp() {
        let frequency = defaults.string(forKey: Keys.frequency)
        textField.text = String(frequency ?? "<no_time>")  + " hours per notification"
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

    
    func createPicker () {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        textField.inputView = picker
    }
    
}
extension FrquencyViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedFrquency = pickerData[row]
        textField.text = String(selectedFrquency) + " hours per notification"
    }
    func createTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}

