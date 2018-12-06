//
//  EnvironmentHelper.swift
//  EnvironmentHelper
//
//  Created by Sergey Petrachkov on 06/12/2018.
//  Copyright © 2018 Actonica. All rights reserved.
//

import Foundation
/**
    Helper class to detect the current environment and retrieve it from iOS app settings
 
    - Requires:
        1) Services.plist added to your project
 
        2) This property list **must** contain the following String properties as in `Environment` enum declaration:
 
          * production
          * staging
          * develop
*/
class EnvironmentHelper {
  /// Default environment. Can be modified externally
  static var defaultEnvironment: Environment = .production
  
  /// Possible environments
  enum Environment: String {
    /// If user has not specified any environment
    case indefinite
    /// Production server
    case production
    /// Release-candidate, staging
    case staging
    /// Regular development
    case develop
    /// Any other
    case custom
  }
  
  /// Call this method to retrieve environment from user preferences
  /// - Parameters:
  ///   - defaultEnvironment: which environment to return if no preferred environment has been found. See also `EnvironmentHelper.defaultEnvironment` static property
  /// - Returns:
  ///   user preferred environment or default either set by user explicitly or implcitly stored in `EnvironmentHelper.defaultEnvironment` property
  static func preferredEnvironment(or defaultEnvironment: Environment = defaultEnvironment) -> Environment {
    if let env = UserDefaults.standard.string(forKey: "environment") {
      if let environment = Environment(rawValue: env) {
        return environment
      } else {
        NSLog("\(#file) \(#line) \(#function) - no valid environment found")
        return .indefinite
      }
    } else {
      NSLog("\(#file) \(#line) \(#function) - no environment key found")
    }
    return defaultEnvironment
  }
  
  /** Call this method to get url string associated with your environment
   
  - Parameters:
     - environment: desired environment
  - Returns:
      either string if **Services.plist** contains specified environment or *nil*
   
   ```
   // retrieve your custom url from user preferences if any
   let customUrl = EnvironmentHelper.environmentUrlString(EnvironmentHelper.preferredEnvironment())
   
   ```
   
  */
  static func environmentUrlString(_ environment: Environment) -> String? {
    if let path = Bundle.main.url(forResource: "Services", withExtension: "plist"),
      let data = try? Data(contentsOf: path) {
      do {
        if let result = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: String] {
          return result[environment.rawValue]
        }
      } catch let error {
        NSLog("\(#file) \(#line) \(#function) - An error has occured while retrieving environment url string. error description: \(error.localizedDescription)")
      }
    } else {
      NSLog("\(#file) \(#line) \(#function) - An error has occured while reading Servises.plist")
    }
    return nil
  }
  
}
