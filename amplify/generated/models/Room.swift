// swiftlint:disable all
import Amplify
import Foundation

public struct Room: Model {
  public let id: String
  public var topic: String?
  public var club: ClubFollow?
  public var roomType: RoomType?
  public var participants: List<RoomParticipant>?
  
  public init(id: String = UUID().uuidString,
      topic: String? = nil,
      club: ClubFollow? = nil,
      roomType: RoomType? = nil,
      participants: List<RoomParticipant>? = []) {
      self.id = id
      self.topic = topic
      self.club = club
      self.roomType = roomType
      self.participants = participants
  }
}