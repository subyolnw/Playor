//
//  Application.swift
//
//  Created by Behrad Kazemi on 11/20/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//

import NetworkPlatform
import Domain
import SoundsPlatform

final class Application {
  static let shared = Application()
  
  private let networkUseCaseProvider: NetworkPlatform.UseCaseProvider
	private let soundsUseCaseProvider: SoundsPlatform.UseCaseProvider
  private init() {
    AnalyticProxy.setup()
    self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
		self.soundsUseCaseProvider = SoundsPlatform.UseCaseProvider()
  }
  
  func configureMainInterface(in window: UIWindow) {
    let mainNavigationController = MainNavigationController()
    window.rootViewController = mainNavigationController
    window.makeKeyAndVisible()
		SplashNavigator(navigationController: mainNavigationController, services: networkUseCaseProvider, soundServices: soundsUseCaseProvider).setup()
  }
}

