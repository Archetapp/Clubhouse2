//
//  ClubhouseModel.swift
//  Clubhouse2
//
//  Created by Jared on 3/15/21.
//

import Foundation

struct Clubhouse {
    var title : String = ""
    var roomId : String = ""
    var numOfPeople : Int = 0
    var numOfSpeakers : Int = 0
    var users : [DummyUser] = []
}


struct DummyUser {
    var id : String = ""
    var name : String = ""
    var profileImage : String = ""
}
