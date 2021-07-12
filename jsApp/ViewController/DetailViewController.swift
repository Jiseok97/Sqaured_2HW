//
//  DetailViewController.swift
//  jsApp
//
//  Created by 이지석 on 2021/07/06.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    var receiveItemTime = ""
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var lblItemTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        giveZ()
        lblItem.text = receiveItem
        lblItemTime.text = "내가 시작할 시간\n" + receiveItemTime
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        //super.viewWillAppear(true)
//        // viewWillAppear(true)
//    }
    @IBAction func alertBtn(_ sender: Any) {
        showAlert()
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
    }
    func receiveItemTime(_ time: String) {
        receiveItemTime = time
    }
    
    
    func giveZ() {
        lblItem.layer.zPosition = 10
        lblItemTime.layer.zPosition = 10
        imgView.layer.zPosition = 0
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "도 움 말", message: "완료한 일은 목록에서 밀어서 삭제해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확 인", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }

}
