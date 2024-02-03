//
//  FilterStack.swift
//  Tracker
//
//  Created by Никита Гончаров on 03.02.2024.
//

import Foundation

enum Filters: String, CaseIterable {
    case allTrackers = "Все трекеры"
    case trackersToday = "Трекеры на сегодня"
    case completedTrackers =  "Завершенные"
    case unCompletedTrackers =  "Не завершенные"
}

