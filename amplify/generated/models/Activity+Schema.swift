// swiftlint:disable all
import Amplify
import Foundation

extension Activity {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case activityType
    case user
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let activity = Activity.keys
    
    model.pluralName = "Activities"
    
    model.fields(
      .id(),
      .field(activity.activityType, is: .required, ofType: .string),
      .belongsTo(activity.user, is: .optional, ofType: User.self, targetName: "activityUserId")
    )
    }
}