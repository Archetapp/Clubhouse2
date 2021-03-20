// swiftlint:disable all
import Amplify
import Foundation

extension Topic {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case clubs
    case topiccategoryID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let topic = Topic.keys
    
    model.pluralName = "Topics"
    
    model.fields(
      .id(),
      .field(topic.name, is: .required, ofType: .string),
      .hasMany(topic.clubs, is: .optional, ofType: ClubTopic.self, associatedWith: ClubTopic.keys.topic),
      .field(topic.topiccategoryID, is: .optional, ofType: .string)
    )
    }
}