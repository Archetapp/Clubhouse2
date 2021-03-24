// swiftlint:disable all
import Amplify
import Foundation

public struct Nomination: Model {
  public let id: String
  public var nominator: User
  public var nominee: User
  
  public init(id: String = UUID().uuidString,
      nominator: User,
      nominee: User) {
      self.id = id
      self.nominator = nominator
      self.nominee = nominee
  }
}