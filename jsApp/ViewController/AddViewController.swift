//
//  AddViewController.swift
//  jsApp
//
//  Created by 이지석 on 2021/07/06.
//

import UIKit

class AddViewController: UIViewController {
    
    var dateTime : String = ""
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        giveZ()
    }
    
    func giveZ() {
        addBtn.layer.zPosition = 10
        tfAddItem.layer.zPosition = 10
        imgView.layer.zPosition = 0
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "도 움 말", message: "완료한 일은 목록에서 밀어서 삭제해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확 인", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    // 새 목록 추가하기
    @IBAction func btnAddItem(_ sender: Any) {
        // 할 일 추가
        items.append(tfAddItem.text!)
        itemsImage.append("check.png")
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
        
        // UIDatePicker에서 가져온 값을 최종적으로 itemTime에 넣어줌
        itemTime.append(dateTime)
        
        // 시간 추가
        
//        let curTime = DateFormatter()
//        curTime.dateFormat = "MM월dd일 - HH시mm분"
//        let currentTime = curTime.string(from: Date())
//        itemTime.append(currentTime)
        
    }
    @IBAction func alertBtn(_ sender: Any) {
        showAlert()
    }
    
    // MARK: 실시간 DatePicker 변화 감지
    @IBAction func datePV(_ sender: UIDatePicker) {
        pickerView.addTarget(self, action: #selector(changed), for: .valueChanged)
    }
    
    // MARK: UIDatePicker 선택시간 추출
    @objc func changed() {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "HH시 mm분"
        let selectDate = dFormatter.string(from: pickerView.date)
        print(selectDate)
        dateTime = selectDate
    }
    
}
