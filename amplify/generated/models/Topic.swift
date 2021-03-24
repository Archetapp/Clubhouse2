// swiftlint:disable all
import Amplify
import Foundation

public struct Topic: Model {
  public let id: String
  public var name: String
  public var clubs: List<ClubTopic>?
  public var topiccategoryID: String?
  
  public init(id: String = UUID().uuidString,
      name: String,
      clubs: List<ClubTopic>? = [],
      topiccategoryID: String? = nil) {
      self.id = id
      self.name = name
      self.clubs = clubs
      self.topiccategoryID = topiccategoryID
  }
}