//
//  MyProfileVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/19.
//

import UIKit

class MyProfileVC: UIViewController {
    // UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    // UITableView
    @IBOutlet weak var myProfileTableView: UITableView!
    
    // UIButton
    @IBOutlet weak var modifyButton: UIButton!
    
    // Variables

    
    // Constants
    let TITLE_LABEL_FONT_SIZE: CGFloat = 18
    let BUTTON_CORNER_RADIUS: CGFloat = 10
    let BUTTON_FONT_SIZE: CGFloat = 18
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI(){
        // UILabel
        titleLabel.font = FontManager.shared.getAppleSDGothicNeoMedium(fontSize: TITLE_LABEL_FONT_SIZE)
        
        // UINavigationController
        self.navigationController?.navigationBar.isHidden = true
        
        // UITableView
        configureTableView()
        
        // UIButton
        configureButton()
    }
    
    private func configureTableView() {
        myProfileTableView.delegate = self
        myProfileTableView.dataSource = self
        myProfileTableView.register(UINib(nibName: "MyProfileTopCell", bundle: nil), forCellReuseIdentifier: "MyProfileTopCell")
        myProfileTableView.register(UINib(nibName: "MyProfileMiddleCell", bundle: nil), forCellReuseIdentifier: "MyProfileMiddleCell")
        myProfileTableView.register(UINib(nibName: "MyProfileBottomCell", bundle: nil), forCellReuseIdentifier: "MyProfileBottomCell")
    }
    
    private func configureButton() {
        modifyButton.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: BUTTON_FONT_SIZE)
        modifyButton.layer.cornerRadius = BUTTON_CORNER_RADIUS
        modifyButton.backgroundColor = .black
        modifyButton.setTitleColor(.white, for: .normal)
    }
    
    // 유저가 화면을 터치했을 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드를 내린다.
        self.view.endEditing(true)
    }
}

extension MyProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTopCell", for: indexPath) as! MyProfileTopCell
            cell.titleLabel.text = "닉네임"
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileMiddleCell", for: indexPath) as! MyProfileMiddleCell
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileBottomCell", for: indexPath) as! MyProfileBottomCell
        cell.selectionStyle = .none
        return cell
    }
}
