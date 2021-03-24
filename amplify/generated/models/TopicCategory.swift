// swiftlint:disable all
import Amplify
import Foundation

public struct TopicCategory: Model {
  public let id: String
  public var nam: String
  public var topics: List<Topic>?
  
  public init(id: String = UUID().uuidString,
      nam: String,
      topics: List<Topic>? = []) {
      self.id = id
      self.nam = nam
      self.topics = topics
  }
}