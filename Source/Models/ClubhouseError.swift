//
//  ClubhouseError.swift
//  Clubhouse2
//
//  Created by Kilo Loco on 3/19/21.
//

import Amplify
import Foundation

enum ClubhouseError: LocalizedError {
    case dataStoreError(Error)
    case unknown
}

extension ClubhouseError {
    init(_ amplifyError: AmplifyError) {
        if amplifyError is DataStoreError {
            self = .dataStoreError(amplifyError)
        } else {
            self = .unknown
        }
    }
}
