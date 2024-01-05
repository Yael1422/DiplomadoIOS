import UIKit

class TabBarController: UITabBarController {
    let modelRef  = dataModel()
    let firstView = ListCollectionViewController()
    let secondView = ListTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        modelRef.upData()
        
        firstView.model = modelRef
        firstView.tabBarItem  = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"),selectedImage: UIImage(systemName: "cart.fill"))
        
        
        secondView.model = modelRef
        secondView.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet.clipboard"),selectedImage: UIImage(systemName: "list.bullet.clipboard.fill"))

        self.setViewControllers([firstView,secondView], animated: false)
        
        //self.tabBar.backgroundColor = .yell
        
        //self
    }
    

}
