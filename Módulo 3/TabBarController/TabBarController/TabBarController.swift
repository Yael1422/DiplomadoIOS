import UIKit

class TabBarController: UITabBarController {

    let firstView = FIrstViewController()
    let secondView = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([firstView, secondView], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
}
