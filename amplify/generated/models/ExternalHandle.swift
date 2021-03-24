// swiftlint:disable all
import Amplify
import Foundation

public struct ExternalHandle: Embeddable {
  var platform: String
  var handle: String
}