// swiftlint:disable all
import Amplify
import Foundation

public struct RoomParticipant: Model {
  public let id: String
  public var roomParticipantRole: String
  public var user: User
  public var roomID: String
  
  public init(id: String = UUID().uuidString,
      roomParticipantRole: String,
      user: User,
      roomID: String) {
      self.id = id
      self.roomParticipantRole = roomParticipantRole
      self.user = user
      self.roomID = roomID
  }
}