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

    @IBOutlet weak var countriesTableView: UITableView!
    
    var countriesArray = [String]()
    var countriesWebServiceApi = generateGetAllCountriesWebApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegateForUIControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchCountriesNames(fromWebApiService: countriesWebServiceApi) { (complete) in
            if complete {
                self.countriesTableView.reloadData()
                print("Data Fetching Successfull")
            } else {
                print("Data Fetching Failed.")
                return
            }
        }
    }
    
    func setDelegateForUIControls() {
        self.countriesTableView.delegate = self
        self.countriesTableView.dataSource = self
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
    
}
