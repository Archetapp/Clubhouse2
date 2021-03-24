// swiftlint:disable all
import Amplify
import Foundation

extension ClubFollow {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case follower
    case clubID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let clubFollow = ClubFollow.keys
    
    model.pluralName = "ClubFollows"
    
    model.fields(
      .id(),
      .belongsTo(clubFollow.follower, is: .required, ofType: User.self, targetName: "clubFollowFollowerId"),
      .field(clubFollow.clubID, is: .optional, ofType: .string)
    )
    }
}