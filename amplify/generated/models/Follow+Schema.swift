// swiftlint:disable all
import Amplify
import Foundation

extension Follow {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case follower
    case followee
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let follow = Follow.keys
    
    model.pluralName = "Follows"
    
    model.fields(
      .id(),
      .belongsTo(follow.follower, is: .required, ofType: User.self, targetName: "followFollowerId"),
      .belongsTo(follow.followee, is: .required, ofType: User.self, targetName: "followFolloweeId")
    )
    }
}