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
    
    var countriesArray = [String]()
    var countriesWebServiceApi = generateGetAllCountriesWebApi()
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegateForUIControls()
        
        // Optimize showCountriesButton style.
        showCountryButton.backgroundColor = UIColor.white
        showCountryButton.layer.cornerRadius = 5
        showCountryButton.layer.borderWidth = 1
        showCountryButton.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchCountriesNames(fromWebApiService: countriesWebServiceApi) { (complete) in
            if complete {
                self.countriesPickerView.reloadAllComponents()
                print("Data Fetching Successfull")
            } else {
                print("Data Fetching Failed.")
                return
            }
        }
    }
    
    func setDelegateForUIControls() {
        self.countriesPickerView.delegate = self
        self.countriesPickerView.dataSource = self
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchCountriesNames(fromWebApiService webApi: String, _ handler: @escaping(_ status: Bool) -> () ) {
        Alamofire.request(webApi).responseJSON { (response) in
            guard let rootJsonObject = response.result.value as? Dictionary<String, AnyObject> else {return}
            if let countries = rootJsonObject["result"] as? [Dictionary<String, AnyObject>] {
                for (index, country) in countries.enumerated() {
                    if let countryName = country["name"] as? String {
                        self.countriesArray.append(countryName)
                    }
                    if index == countries.count - 1 {
                        handler(true)
                    }
                }
            }
        }
    }
    
    @IBAction func showCountryButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "\(selectedCountry ?? "")", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
