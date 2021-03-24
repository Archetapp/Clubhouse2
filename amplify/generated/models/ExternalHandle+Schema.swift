// swiftlint:disable all
import Amplify
import Foundation

extension ExternalHandle {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case platform
    case handle
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let externalHandle = ExternalHandle.keys
    
    model.pluralName = "ExternalHandles"
    
    model.fields(
      .field(externalHandle.platform, is: .required, ofType: .string),
      .field(externalHandle.handle, is: .required, ofType: .string)
    )
    }
}