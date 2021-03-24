// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case handle
    case followerCount
    case followingCount
    case bio
    case externalHandles
    case joinDate
    case clubs
    case avatarKey
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.name, is: .optional, ofType: .string),
      .field(user.handle, is: .required, ofType: .string),
      .field(user.followerCount, is: .required, ofType: .int),
      .field(user.followingCount, is: .required, ofType: .int),
      .field(user.bio, is: .optional, ofType: .string),
      .field(user.externalHandles, is: .optional, ofType: .embeddedCollection(of: ExternalHandle.self)),
      .field(user.joinDate, is: .optional, ofType: .dateTime),
      .hasMany(user.clubs, is: .optional, ofType: ClubUser.self, associatedWith: ClubUser.keys.user),
      .field(user.avatarKey, is: .optional, ofType: .string)
    )
    }
}