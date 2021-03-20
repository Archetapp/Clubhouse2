// swiftlint:disable all
import Amplify
import Foundation

public struct RoomType: Model {
  public let id: String
  public var title: String
  public var club: ClubFollow?
  
  public init(id: String = UUID().uuidString,
      title: String,
      club: ClubFollow? = nil) {
      self.id = id
      self.title = title
      self.club = club
  }
}