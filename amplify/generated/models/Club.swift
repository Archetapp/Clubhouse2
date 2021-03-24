// swiftlint:disable all
import Amplify
import Foundation

public struct Club: Model {
  public let id: String
  public var name: String
  public var members: List<ClubUser>?
  public var description: String?
  public var topics: List<ClubTopic>?
  public var clubFollows: List<ClubFollow>?
  
  public init(id: String = UUID().uuidString,
      name: String,
      members: List<ClubUser> = [],
      description: String? = nil,
      topics: List<ClubTopic>? = [],
      clubFollows: List<ClubFollow>? = []) {
      self.id = id
      self.name = name
      self.members = members
      self.description = description
      self.topics = topics
      self.clubFollows = clubFollows
  }
}