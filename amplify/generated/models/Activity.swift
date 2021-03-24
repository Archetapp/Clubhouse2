// swiftlint:disable all
import Amplify
import Foundation

public struct Activity: Model {
  public let id: String
  public var activityType: String
  public var user: User
  
  public init(id: String = UUID().uuidString,
      activityType: String,
      user: User) {
      self.id = id
      self.activityType = activityType
      self.user = user
  }
}