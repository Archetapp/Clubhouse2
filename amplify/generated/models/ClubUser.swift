// swiftlint:disable all
import Amplify
import Foundation

public struct ClubUser: Model {
  public let id: String
  public var club: Club
  public var user: User
  
  public init(id: String = UUID().uuidString,
      club: Club,
      user: User) {
      self.id = id
      self.club = club
      self.user = user
  }
}