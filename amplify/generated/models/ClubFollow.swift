// swiftlint:disable all
import Amplify
import Foundation

public struct ClubFollow: Model {
  public let id: String
  public var follower: User
  public var clubID: String?
  
  public init(id: String = UUID().uuidString,
      follower: User,
      clubID: String? = nil) {
      self.id = id
      self.follower = follower
      self.clubID = clubID
  }
}