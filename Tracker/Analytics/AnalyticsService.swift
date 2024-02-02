//
//  AnalyticsService.swift
//  Tracker
//
//  Created by Никита Гончаров on 03.02.2024.
//

import Foundation
import YandexMobileMetrica

struct AnalyticsService {
    static func activate() {
        guard let configuration = YMMYandexMetricaConfiguration(
            apiKey: "b225c77d-23fb-49aa-8f05-00b5cd438460"
        ) else { return }
        YMMYandexMetrica.activate(with: configuration)
    }
    
    func report(event: String, params: [AnyHashable: Any]) {
        YMMYandexMetrica.reportEvent(event,
                                     parameters: params,
                                     onFailure: { error in
            print("REPORT ERROR: %@", error.localizedDescription)})
    }
}

