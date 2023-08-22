import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = imageName, let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

