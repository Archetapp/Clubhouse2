// swiftlint:disable all
import Amplify
import Foundation

public struct ClubTopic: Model {
  public let id: String
  public var club: Club
  public var topic: Topic
  
  public init(id: String = UUID().uuidString,
      club: Club,
      topic: Topic) {
      self.id = id
      self.club = club
      self.topic = topic
  }
}