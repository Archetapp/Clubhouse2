// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "9dda82af27fd4f449521d3a21b92f2d9"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: RoomParticipant.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: ClubUser.self)
    ModelRegistry.register(modelType: Club.self)
    ModelRegistry.register(modelType: ClubTopic.self)
    ModelRegistry.register(modelType: Topic.self)
    ModelRegistry.register(modelType: ClubFollow.self)
    ModelRegistry.register(modelType: Nomination.self)
    ModelRegistry.register(modelType: Follow.self)
    ModelRegistry.register(modelType: Activity.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: TopicCategory.self)
    ModelRegistry.register(modelType: RoomType.self)
    ModelRegistry.register(modelType: Room.self)
  }
}