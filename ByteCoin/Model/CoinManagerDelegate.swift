//
// Created by Thomas Strauß on 13.06.21.
// Copyright (c) 2021 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetchWithSuccess(_ manager:CoinManager, exchangeRate:Double, forCurrency:Int)
    func didFinishWithError(_ manager:CoinManager, error:Error)
}
