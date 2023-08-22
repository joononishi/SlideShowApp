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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentImageIndex = (currentImageIndex + 1) % images.count
        updateImage()
    }

    @IBAction func prevButtonTapped(_ sender: UIButton) {
        currentImageIndex = (currentImageIndex - 1 + images.count) % images.count
        updateImage()
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if timer == nil {
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            playPauseButton.setTitle("停止", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoSlideShow), userInfo: nil, repeats: true)
        } else {
            stopSlideShow()
        }
    }

    @objc func autoSlideShow() {
        currentImageIndex = (currentImageIndex + 1) % images.count
        updateImage()
    }

    func stopSlideShow() {
        timer?.invalidate()
        timer = nil
        nextButton.isEnabled = true
        prevButton.isEnabled = true
        playPauseButton.setTitle("再生", for: .normal)
    }

    func updateImage() {
        if let image = UIImage(named: images[currentImageIndex]) {
            imageView.image = image
        }
    }

    @objc func imageTapped() {
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController {
            secondVC.imageName = images[currentImageIndex]
        }
    }
}


