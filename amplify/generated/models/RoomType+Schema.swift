// swiftlint:disable all
import Amplify
import Foundation

extension RoomType {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case club
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let roomType = RoomType.keys
    
    model.pluralName = "RoomTypes"
    
    model.fields(
      .id(),
      .field(roomType.title, is: .required, ofType: .string),
      .belongsTo(roomType.club, is: .optional, ofType: ClubFollow.self, targetName: "roomTypeClubId")
    )
    }
}