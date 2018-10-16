//
//  HomePickerDelegate.swift
//  AuthenticationApp
//
//  Created by Ahmed Elbasha on 10/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCountry = countriesArray[pickerView.selectedRow(inComponent: 0)]
        selectedCountry = currentCountry
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let currentCountry = countriesArray[row]
        return currentCountry
    }
}
