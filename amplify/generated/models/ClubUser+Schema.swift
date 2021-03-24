// swiftlint:disable all
import Amplify
import Foundation

extension ClubUser {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case club
    case user
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let clubUser = ClubUser.keys
    
    model.pluralName = "ClubUsers"
    
    model.fields(
      .id(),
      .belongsTo(clubUser.club, is: .required, ofType: Club.self, targetName: "clubID"),
      .belongsTo(clubUser.user, is: .required, ofType: User.self, targetName: "userID")
    )
    }
}