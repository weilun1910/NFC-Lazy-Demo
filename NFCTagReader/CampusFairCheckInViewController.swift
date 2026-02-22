import UIKit

final class CampusFairCheckInViewController: UIViewController {
    private let imageView = UIImageView()
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
    private var hasTransitionedToConnectedScreen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureImageView()
        configureTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setNeedsStatusBarAppearanceUpdate()
    }

    override var prefersStatusBarHidden: Bool {
        true
    }

    private func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "company_page")
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func configureTapGesture() {
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc
    private func handleScreenTap() {
        transitionToConnectedScreen()
    }

    private func transitionToConnectedScreen() {
        guard !hasTransitionedToConnectedScreen, presentedViewController == nil else { return }

        hasTransitionedToConnectedScreen = true
        let connectedViewController = CompanyCardViewController()
        connectedViewController.modalPresentationStyle = .fullScreen
        connectedViewController.modalTransitionStyle = .crossDissolve
        present(connectedViewController, animated: true)
    }
}
