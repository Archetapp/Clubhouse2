// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String?
  public var handle: String
  public var followerCount: Int
  public var followingCount: Int
  public var bio: String?
  public var externalHandles: [ExternalHandle]?
  public var joinDate: Temporal.DateTime?
  public var clubs: List<ClubUser>?
  public var avatarKey: String?
  
  public init(id: String = UUID().uuidString,
      name: String? = nil,
      handle: String,
      followerCount: Int,
      followingCount: Int,
      bio: String? = nil,
      externalHandles: [ExternalHandle]? = [],
      joinDate: Temporal.DateTime? = nil,
      clubs: List<ClubUser>? = [],
      avatarKey: String? = nil) {
      self.id = id
      self.name = name
      self.handle = handle
      self.followerCount = followerCount
      self.followingCount = followingCount
      self.bio = bio
      self.externalHandles = externalHandles
      self.joinDate = joinDate
      self.clubs = clubs
      self.avatarKey = avatarKey
  }
}