//
//  DataService.swift
//  Clubhouse2
//
//  Created by Kilo Loco on 3/19/21.
//

import Combine
import Foundation

protocol DataService {
    func getRooms() -> AnyPublisher<[Room], ClubhouseError>
}
