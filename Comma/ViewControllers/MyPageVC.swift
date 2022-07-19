//
//  MyPageVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyPageVC: UIViewController {
    // UITableView
    @IBOutlet weak var myPageTableView: UITableView!
    
    // Variables
    var myPageList = [
        [""],
        ["나의 프로필",
        "나의 Passport",
        "내가 담은 공간",
        "쿠폰함",
        "환경설정",
        "자주 묻는 질문",
        "Comma 서비스 소개",
        "문의하기"]
    
    ]
    
    // Constants
    let SECTION_NUNBER = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        // UITableView
        configureTableView()
    }
    
    private func configureTableView() {
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        myPageTableView.register(UINib(nibName: "MyPageTopCell", bundle: nil), forCellReuseIdentifier: "MyPageTopCell")
        myPageTableView.register(UINib(nibName: "MyPageBottomCell", bundle: nil), forCellReuseIdentifier: "MyPageBottomCell")
    }

}

extension MyPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SECTION_NUNBER
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTopCell", for: indexPath) as! MyPageTopCell
            cell.titleLabel.text = "Hello, Eddy님 !"
            cell.descriptionLabel.text = "Life is Short"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageBottomCell", for: indexPath) as! MyPageBottomCell
        
        cell.titleLabel.text = myPageList[indexPath.section][indexPath.row]
        if indexPath.section == 1 && (indexPath.row == 0 || indexPath.row == 5) {
            cell.lineView.isHidden = false
            cell.lineView.alpha = 1
        } else {
            cell.lineView.isHidden = true
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}
