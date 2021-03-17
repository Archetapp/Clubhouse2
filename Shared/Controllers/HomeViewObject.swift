//
//  ClubhouseObject.swift
//  Clubhouse2 (iOS)
//
//  Created by Jared on 3/15/21.
//

import Foundation
import SwiftUI

class HomeViewObject : ObservableObject {
    static let shared = HomeViewObject()
    private init() {}
    
    var activeClubhouses : [Clubhouse] = [Clubhouse(title: "Something Awesome", roomId: "1", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"),User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"), User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"),User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "SOmething Random", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "2", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "3", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "4", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "5", numOfPeople: 15, numOfSpeakers: 4, users: [User(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),]
    
    func loadActiveClubhouses() {
        //Kilo Loco will handle this
    }
}
