//
//  ClubhouseObject.swift
//  Clubhouse2
//
//  Created by Jared on 3/15/21.
//

import Combine
import Foundation
import SwiftUI

class HomeViewObject : ObservableObject {
    
    @Published var rooms = [Room]()
    
    private let dataService: DataService
    
    private var tokens = Set<AnyCancellable>()
    
    static let shared = HomeViewObject()
    
    private init(manager: DependencyManager = ClubhouseDependencyManager.shared) {
        self.dataService = manager.dataService
    }
    
    var activeClubhouses : [Clubhouse] = [Clubhouse(title: "Something Awesome", roomId: "1", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"),DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"), DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage"),DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "SOmething Random", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "2", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "3", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "4", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),Clubhouse(title: "Something Awesome", roomId: "5", numOfPeople: 15, numOfSpeakers: 4, users: [DummyUser(id: UUID().uuidString, name: "Jared Davidson", profileImage: "testImage")]),]
    
    func loadActiveClubhouses() {
        dataService.getRooms()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] rooms in
                self?.rooms = rooms
            }
            .store(in: &tokens)
    }
}
