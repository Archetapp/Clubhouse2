// swiftlint:disable all
import Amplify
import Foundation

public struct Follow: Model {
  public let id: String
  public var follower: User
  public var followee: User
  
  public init(id: String = UUID().uuidString,
      follower: User,
      followee: User) {
      self.id = id
      self.follower = follower
      self.followee = followee
  }
}