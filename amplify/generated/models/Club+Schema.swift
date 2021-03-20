// swiftlint:disable all
import Amplify
import Foundation

extension Club {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case members
    case description
    case topics
    case clubFollows
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let club = Club.keys
    
    model.pluralName = "Clubs"
    
    model.fields(
      .id(),
      .field(club.name, is: .required, ofType: .string),
      .hasMany(club.members, is: .optional, ofType: ClubUser.self, associatedWith: ClubUser.keys.club),
      .field(club.description, is: .optional, ofType: .string),
      .hasMany(club.topics, is: .optional, ofType: ClubTopic.self, associatedWith: ClubTopic.keys.club),
      .hasMany(club.clubFollows, is: .optional, ofType: ClubFollow.self, associatedWith: ClubFollow.keys.clubID)
    )
    }
}