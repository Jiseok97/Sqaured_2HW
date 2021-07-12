//
//  SceneDelegate.swift
//  jsApp
//
//  Created by 이지석 on 2021/07/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // 액티브 상태가 되었을 때
        callBackgroundImage(false)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // App Switcher 모드
        callBackgroundImage(true)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 백그라운드 상태였다가 돌아왔을 경우
        callBackgroundImage(false)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 백그라운드 상태로 갔을 경우
        callBackgroundImage(true)
    }

    func callBackgroundImage(_ bShow: Bool) {
            
            let TAG_BG_IMG = -101
            
            // window => 스토리 보드를 표시할 때 사용할 창
            // rootViewController => 앱 최초 생성시 존재하는 VC
            // viewWithTag => 태그가 지정된 값과 일치하는 뷰를 반환함
            let backgroundView = window?.rootViewController?.view.window?.viewWithTag(TAG_BG_IMG)

            if bShow {

                if backgroundView == nil {

                    let bgView = UIView()
                    bgView.frame = UIScreen.main.bounds
                    bgView.tag = TAG_BG_IMG
                    bgView.backgroundColor = .black

                    let lbl = UILabel()
                    lbl.frame = UIScreen.main.bounds
                    lbl.textAlignment = .center
                    lbl.font = UIFont.systemFont(ofSize: 30)
                    lbl.textColor = .white
                    lbl.numberOfLines = 0
                    lbl.text = "나만 알고 싶은\n나의 하루"
                    bgView.addSubview(lbl)

                    window?.rootViewController?.view.window?.addSubview(bgView)
                }
            } else {

                if let backgroundView = backgroundView {
                    // 뷰의 superview가 아닌 nil 경우 superview 보기를 해제함
                    backgroundView.removeFromSuperview()
                }
            }
        }

}

