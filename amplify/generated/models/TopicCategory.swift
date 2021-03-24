// swiftlint:disable all
import Amplify
import Foundation

public struct TopicCategory: Model {
  public let id: String
  public var name: String
  public var topics: List<Topic>?
  
  public init(id: String = UUID().uuidString,
      name: String,
      topics: List<Topic> = []) {
      self.id = id
      self.name = name
      self.topics = topics
  }
}