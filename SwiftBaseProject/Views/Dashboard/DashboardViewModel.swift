//
//  DashboardViewModel.swift
//  SwiftBaseProject
//
//  Created by Mauricio Cousillas on 3/15/18.
//  Copyright © 2018 Mauricio Cousillas. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class DashboardViewModel {

  private var disposeBag = DisposeBag()
  var user = BehaviorRelay<User?>(value: nil)

  init() {
    user.accept(UserController.sharedInstance.currentUser)
  }

  func logout() {
    UserController.sharedInstance.logout()
      .subscribe(
        onNext: { _ in
          AppRouter.sharedInstance.navigate(to: LoginRoute.login(username: AppDelegate.getUserNameFromDefaults()), with: .changeRoot)
        }
      ).disposed(by: disposeBag)
  }

}
