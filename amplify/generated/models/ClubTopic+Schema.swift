// swiftlint:disable all
import Amplify
import Foundation

extension ClubTopic {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case club
    case topic
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let clubTopic = ClubTopic.keys
    
    model.pluralName = "ClubTopics"
    
    model.fields(
      .id(),
      .belongsTo(clubTopic.club, is: .required, ofType: Club.self, targetName: "clubID"),
      .belongsTo(clubTopic.topic, is: .required, ofType: Topic.self, targetName: "topicID")
    )
    }
}