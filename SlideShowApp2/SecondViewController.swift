import UIKit
class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
