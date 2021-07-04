//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {

    @IBOutlet weak var exchangeRateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!

    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        currencyPicker.reloadAllComponents()
        let selectedRow = currencyPicker.selectedRow(inComponent: 0)
        currencyLabel.text = coinManager.currencyArray[selectedRow]

        coinManager.delegate = self
        coinManager.fetchExchangeRate(forCurrency:selectedRow)
    }
}

// MARK: -- UIPickerViewDelegate
extension ByteCoinViewController : UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencySymbol = coinManager.currencyArray[row]
        print("did select row \(row) in component \(component) : \(currencySymbol)")
        currencyLabel.text = currencySymbol
        coinManager.fetchExchangeRate(forCurrency: row)
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
}
   
// MARK: -- UIPickerViewDataSource
extension ByteCoinViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1; }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count;
    }
}

// MARK: -- CoinManagerDelegate

extension ByteCoinViewController : CoinManagerDelegate {
    func didFetchWithSuccess(_ manager: CoinManager, exchangeRate: Double, forCurrency: Int) {
        DispatchQueue.main.async {
            self.currencyLabel.text = manager.currencyArray[forCurrency]
            self.exchangeRateLabel.text = String(format:"%.02f", exchangeRate)
        }
    }

    func didFinishWithError(_ manager: CoinManager, error: Error) {
        print("An error has occured \(error)")
    }

}