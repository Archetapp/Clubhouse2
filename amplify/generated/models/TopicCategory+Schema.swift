// swiftlint:disable all
import Amplify
import Foundation

extension TopicCategory {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case nam
    case topics
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let topicCategory = TopicCategory.keys
    
    model.pluralName = "TopicCategories"
    
    model.fields(
      .id(),
      .field(topicCategory.nam, is: .required, ofType: .string),
      .hasMany(topicCategory.topics, is: .optional, ofType: Topic.self, associatedWith: Topic.keys.topiccategoryID)
    )
    }
}