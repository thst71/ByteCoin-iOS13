//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "12D4BB5F-263C-4C34-A7FE-2AB26B5FC538<"
    var delegate : CoinManagerDelegate?

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchExchangeRate(forCurrency: Int) {
        print("reading data for currency \(forCurrency)")

        delegate?.didFetchWithSuccess(self, exchangeRate: 31000.0, forCurrency: forCurrency)
    }
}
