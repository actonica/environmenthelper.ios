//
//  ViewController.swift
//  EnvironmentHelperExample
//
//  Created by Sergey Petrachkov on 06/12/2018.
//  Copyright © 2018 Actonica. All rights reserved.
//

import UIKit
import EnvironmentHelper
class ViewController: UIViewController {

  @IBOutlet weak var serverPreferenceLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let serverUrl = EnvironmentHelper.environmentUrlString(EnvironmentHelper.preferredEnvironment()) {
      serverPreferenceLabel.text = serverUrl
    } else {
      serverPreferenceLabel.text = "Server url is undefined"
    }
  }


}

