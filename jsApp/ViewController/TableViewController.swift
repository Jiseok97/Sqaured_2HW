//
//  TableViewController.swift
//  jsApp
//
//  Created by 이지석 on 2021/07/06.
//

import UIKit

// 앱 시작시 나타낼 목록
var items = ["과제하기"]
var itemsImage = ["check.png"]
var itemTime = ["OO월OO일 - 00시00분"]

// titleProtocol 채택
class TableViewController: UITableViewController, titleProtocol {
    
    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarColor()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // Navbar style
    func setNavbarColor() {
        
        // titleText Color
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.brown]
        
        // barBg color
        self.navigationController?.navigationBar.backgroundColor = .brown
        
        // tintColor
        self.navigationController?.navigationBar.tintColor = .brown
        
    }
    
    func dataSend(data: String) {
        self.title = data + "의 하루"
    }
    
    
    // 이름 등록화면 띄우기
    @IBAction func rgsterBtn(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "RegisterViewController")
                as? RegisterViewController else { return }
        
        // RegisgterVC에서 선언해둔 delegate를 self 선언하여
        // 처리할 부분이 여기 VC 라는 것을 선언
        nextVC.delegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    // 뷰가 노출될 때마다 리스트의 데이터 다시 불러옴
    // 추가된 내용을 위한 새로고침
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // 테이블 안의 섹션 개수를 1로 설정
    // numberOfSections => 데이터 소스에 테이블보기의 섹션 수를 반환하도록 요청
    // tableView의 센션 수 반환
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // items의 원소 갯수만큼 열을 만듬
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    // items와 itemsIamge의 값을 셀에 삽입
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // cell items
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        // cell itemsImage
        cell.imageView?.image = UIImage(named: itemsImage[(indexPath as NSIndexPath).row])
        
        // cell itemTime
        // subTitle
//        cell.detailTextLabel?.text = itemTime[(indexPath as NSIndexPath).row]
//        cell.detailTextLabel?.textColor = .gray
        
        
        // cell 색 넣기
//        cell.backgroundColor = .lightGray
        
        // subTitle의 날짜 넣기
//        cell.detailTextLabel?.text = (inexPath as NSIndexPath).row.inser
        return cell
    }
    
    // 목록 삭제 func
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // 삭제
                items.remove(at: (indexPath as NSIndexPath).row)
                itemsImage.remove(at: (indexPath as NSIndexPath).row)
                itemTime.remove(at: (indexPath as NSIndexPath).row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert { }
        }
        
        // 삭제 시 "Delete" 대신 "삭제"로 표시
        override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            return "삭제"
            
        }
        
        // 목록 순서 바꾸기
        // fromIndexPath => 이동할 행을 찾는 인덱스 경로
        // to => 이동 대상인 행을 찾는 인덱스 경로
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            // 이동할 아이템과 이미지 위치를 저장
            let itemMove = items[(fromIndexPath as NSIndexPath).row]
            let itemImageMove = itemsImage[(fromIndexPath as NSIndexPath).row]
            let itemTimeMove = itemTime[(fromIndexPath as NSIndexPath).row]
            
            // 이동할 아이템 삭제, 하위 요소들의 인덱스 재정렬 됨
            items.remove(at:(fromIndexPath as NSIndexPath).row)
            itemsImage.remove(at:(fromIndexPath as NSIndexPath).row)
            itemTime.remove(at:(fromIndexPath as NSIndexPath).row)
            
            // 삭제된 아이템을 이동할 위치에 삽입
            items.insert(itemMove, at:(to as NSIndexPath).row)
            itemsImage.insert(itemImageMove, at: (to as NSIndexPath).row)
            itemTime.insert(itemTimeMove, at: (to as NSIndexPath).row)
        }
    
    
        // 세그웨이를 이용하여 디테일 뷰로 전환하기
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // sgDetail => Storyboard Segue identifier
            if segue.identifier == "sgDetail" {
                // sender => UIAction 중 하나로, 액션 핸들러를 담당하는 객체
                let cell = sender as! UITableViewCell
                let indexPath = self.tvListView.indexPath(for: cell)
                // segue.destination => 전환하고자 하는 도착점에 대항하는 뷰 컨트롤러를 가리킴
                let detailView = segue.destination as! DetailViewController
                
                // detailView에 있는 receiveItem의 인덱스 경로에 맞는 데이터 불러옴
                // receiveItemTime 포함
                detailView.receiveItem(items[((indexPath as NSIndexPath?)?.row)!])
                detailView.receiveItemTime(itemTime[((indexPath as NSIndexPath?)?.row)!])
            }
        }
        

}
