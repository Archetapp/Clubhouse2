// swiftlint:disable all
import Amplify
import Foundation

extension Room {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case topic
    case club
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let room = Room.keys
    
    model.pluralName = "Rooms"
    
    model.fields(
      .id(),
      .field(room.topic, is: .optional, ofType: .string),
      .belongsTo(room.club, is: .optional, ofType: ClubFollow.self, targetName: "roomClubId")
    )
    }
}