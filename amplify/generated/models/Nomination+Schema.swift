// swiftlint:disable all
import Amplify
import Foundation

extension Nomination {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case nominator
    case nominee
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let nomination = Nomination.keys
    
    model.pluralName = "Nominations"
    
    model.fields(
      .id(),
      .belongsTo(nomination.nominator, is: .required, ofType: User.self, targetName: "nominationNominatorId"),
      .belongsTo(nomination.nominee, is: .required, ofType: User.self, targetName: "nominationNomineeId")
    )
    }
}