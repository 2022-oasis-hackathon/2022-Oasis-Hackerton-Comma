//
//  OnBoardingPageVC.swift
//  Comma
//
//  Created by myungsun on 2022/07/18.
//

import UIKit

class OnBoardingPageVC: UIPageViewController {
    // Variables
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    // Constants
    let startIndex = 0
    let BUTTON_FONT_SIZE: CGFloat = 17
    let BUTTON_CORNER_RADIUS: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeOnboardingPages()
    }
    
    private func makeOnboardingPages() {
        let firstOnboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstOnboardingPageVC") as! FirstOnboardingPageVC
        firstOnboardingVC.firstDescription = "도심에서의 치열한 삶이,"
        firstOnboardingVC.secondDescription = "당신을 지치게 하지는 않나요?"
        firstOnboardingVC.onBoardingImage = UIImage(named: "FirstOnboardingImage")
        
        let secondOnboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstOnboardingPageVC") as! FirstOnboardingPageVC
        secondOnboardingVC.firstDescription = "인생이라는 긴 서사를 써 내려갈 당신,"
        secondOnboardingVC.secondDescription = "잠시 쉼표를 찍고 쉬어가는게 어때요?"
        secondOnboardingVC.onBoardingImage = UIImage(named: "SecondOnboardingImage")
        
        let lastOnboardingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LastOnboardingPageVC") as! LastOnboardingPageVC
        
        pages.append(firstOnboardingVC)
        pages.append(secondOnboardingVC)
        pages.append(lastOnboardingVC)
        
        setViewControllers([firstOnboardingVC], direction: .forward, animated: true, completion: nil)
        
        self.delegate = self
        self.dataSource = self
        makeBottomButton()
        makePageControl()
    }
    
    private func makeBottomButton() {
        let button = UIButton()
        button.setTitle("지금 바로 여행 시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = FontManager.shared.getAppleSDGothicNeoSemiBold(fontSize: BUTTON_FONT_SIZE)
        button.layer.cornerRadius = BUTTON_CORNER_RADIUS
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
        hideButton()
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true)
    }
    
    private func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = ColorManager.shared.getThemeMain()
        pageControl.pageIndicatorTintColor = ColorManager.shared.getPageControlDisableColor()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        pageControl.isUserInteractionEnabled = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

extension OnBoardingPageVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        self.currentIndex = currentIndex
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
}

extension OnBoardingPageVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first else { return }
        guard let currentIndex = pages.firstIndex(of: currentVC) else { return }
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            // show button
            self.showButton()
        } else {
            self.hideButton()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: self.view.layoutIfNeeded, completion: { _ in
            
        })
    }
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
