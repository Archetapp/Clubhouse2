// swiftlint:disable all
import Amplify
import Foundation

public struct Event: Model {
  public let id: String
  public var date: Temporal.DateTime
  public var description: String?
  public var room: Room
  
  public init(id: String = UUID().uuidString,
      date: Temporal.DateTime,
      description: String? = nil,
      room: Room) {
      self.id = id
      self.date = date
      self.description = description
      self.room = room
  }
}