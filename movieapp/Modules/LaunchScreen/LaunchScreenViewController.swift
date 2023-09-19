//
//  LaunchScreenViewController.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation
import UIKit
import FirebaseRemoteConfig

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var launchScreenText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        printText()
        networkControl()
    }
    func printText() {
        RemoteConfig.remoteConfig().fetchAndActivate { value, error in
            let launchText = RemoteConfig.remoteConfig()
              .configValue(forKey: "launch_screen")
              .stringValue ?? ""
            self.launchScreenText.text = launchText
        }
    }
    func networkControl() {
        if Reachability.isConnectedToNetwork() {
            let seconds = 3.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                let vm = HomePageViewModel()
                let vc = HomePageViewController.instantiate(viewModel: vm)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
