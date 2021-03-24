//
//  AmplifyDataService.swift
//  Clubhouse2
//
//  Created by Kilo Loco on 3/19/21.
//

import Amplify
import Combine
import Foundation

// Schema: 69dd8f91-fb1c-4097-be88-9250cf0454d1

class AmplifyDataService: DataService {
    func getRooms() -> AnyPublisher<[Room], ClubhouseError> {
        Amplify.DataStore.query(Room.self)
            .mapError(ClubhouseError.init)
            .eraseToAnyPublisher()
    }
}
