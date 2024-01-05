import UIKit

class FIrstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Primero"
        self.tabBarItem.image = UIImage(systemName: "eraser")
        self.tabBarItem.selectedImage = UIImage(systemName: "eraser.fill")
    }
}
