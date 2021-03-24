// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "673c8de66c48c44dd50243b123bf3972"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: ClubFollow.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: ClubUser.self)
    ModelRegistry.register(modelType: Club.self)
    ModelRegistry.register(modelType: ClubTopic.self)
    ModelRegistry.register(modelType: Topic.self)
    ModelRegistry.register(modelType: Nomination.self)
    ModelRegistry.register(modelType: Follow.self)
    ModelRegistry.register(modelType: Activity.self)
    ModelRegistry.register(modelType: Event.self)
    ModelRegistry.register(modelType: Room.self)
    ModelRegistry.register(modelType: TopicCategory.self)
    ModelRegistry.register(modelType: RoomType.self)
  }
}