// swiftlint:disable all
import Amplify
import Foundation

extension Event {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case date
    case description
    case room
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let event = Event.keys
    
    model.pluralName = "Events"
    
    model.fields(
      .id(),
      .field(event.date, is: .required, ofType: .dateTime),
      .field(event.description, is: .optional, ofType: .string),
      .belongsTo(event.room, is: .required, ofType: RoomParticipant.self, targetName: "eventRoomId")
    )
    }
}