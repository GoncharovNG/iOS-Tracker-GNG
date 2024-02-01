//
//  Analytics.swift
//  Tracker
//
//  Created by Никита Гончаров on 31.01.2024.
//

import Foundation
import YandexMobileMetrica

final class Analytics {
    static let shared = Analytics()
    
    func report(_ event: String, params : [AnyHashable : Any]) {
        YMMYandexMetrica.reportEvent(event, parameters: params, onFailure: { error in
            print("REPORT ERROR: %@", error.localizedDescription)
        })
    }
}
