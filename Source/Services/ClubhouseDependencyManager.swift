//
//  ClubhouseDependencyManager.swift
//  Clubhouse2
//
//  Created by Kilo Loco on 3/19/21.
//

import Foundation

class ClubhouseDependencyManager: DependencyManager {
    private init() {}
    static let shared = ClubhouseDependencyManager()
    
    let dataService: DataService = AmplifyDataService()
}
