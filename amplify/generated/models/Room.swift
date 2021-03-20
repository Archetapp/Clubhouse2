// swiftlint:disable all
import Amplify
import Foundation

public struct Room: Model {
  public let id: String
  public var topic: String?
  public var club: ClubFollow?
  
  public init(id: String = UUID().uuidString,
      topic: String? = nil,
      club: ClubFollow? = nil) {
      self.id = id
      self.topic = topic
      self.club = club
  }
}