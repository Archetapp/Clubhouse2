// swiftlint:disable all
import Amplify
import Foundation

extension RoomParticipant {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case roomParticipantRole
    case user
    case roomID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let roomParticipant = RoomParticipant.keys
    
    model.pluralName = "RoomParticipants"
    
    model.fields(
      .id(),
      .field(roomParticipant.roomParticipantRole, is: .required, ofType: .string),
      .belongsTo(roomParticipant.user, is: .required, ofType: User.self, targetName: "roomParticipantUserId"),
      .field(roomParticipant.roomID, is: .required, ofType: .string)
    )
    }
}