//
//  HomeViewController.swift
//  AuthenticationApp
//
//  Created by Ahmed Elbasha on 10/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var countriesPickerView: UIPickerView!
    @IBOutlet weak var showCountryButton: UIButton!
    
    var countries = [String]()
    var countriesWebServiceApi = generateGetAllCountriesWebApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegateForUIControls()
        
        // Optimize showCountriesButton style.
        showCountryButton.backgroundColor = UIColor.white
        showCountryButton.layer.cornerRadius = 5
        showCountryButton.layer.borderWidth = 1
        showCountryButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setDelegateForUIControls() {
        self.countriesPickerView.delegate = self
        self.countriesPickerView.dataSource = self
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
    }
    
    func fetchCountriesNames(fromWebApiService webApi: String) {
        
    }
    
    @IBAction func showCountryButtonPressed(_ sender: Any) {
    }
}
