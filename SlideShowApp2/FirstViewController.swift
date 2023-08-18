import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!

    let images = ["image1", "image2", "image3", "image4"]
    var currentImageIndex = 0
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
    }
    @objc func nextImage(_ sender: Any) {
        currentImageIndex = (currentImageIndex + 1) % images.count
        updateImage()
    }


    @IBAction func nextButton(_ sender: Any) {
        currentImageIndex = (currentImageIndex + 1) % images.count
        updateImage()
    }

    @IBAction func prevButton(_ sender: Any) {
        currentImageIndex = (currentImageIndex - 1 + images.count) % images.count
        updateImage()
    }

    @IBAction func playPauseButton(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_:)), userInfo: nil, repeats: true)
            playPauseButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        } else {
            timer?.invalidate()
            timer = nil
            playPauseButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
    }

    func updateImage() {
        let imageName = images[currentImageIndex]
        imageView.image = UIImage(named: imageName)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController, segue.identifier == "ToSecondViewController" {
            secondVC.imageName = images[currentImageIndex]
        }
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ToSecondViewController", sender: self)
    }
}


