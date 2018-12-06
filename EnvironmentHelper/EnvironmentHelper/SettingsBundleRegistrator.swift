//
//  AppDelegate+.swift
//  EnvironmentHelper
//
//  Created by Sergey Petrachkov on 06/12/2018.
//  Copyright © 2018 Actonica. All rights reserved.
//

import Foundation

/// Protocol which defines a behavior of an object that is responsible for settings.bundle registration
public protocol SettingsBundleRegistrator {}

extension SettingsBundleRegistrator {
  /// Register settings bundle in the app
  public func registerSettingsBundle() {
    let appDefaults = [String: AnyObject]()
    UserDefaults.standard.register(defaults: appDefaults)
  }
}

