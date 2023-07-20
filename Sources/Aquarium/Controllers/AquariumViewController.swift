// AquariumViewController.swift

import UIKit

class AquariumViewController: UIViewController {
    let aquarium: Aquarium

    init(aquarium: Aquarium) {
        self.aquarium = aquarium
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Aquarium Information"

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])

        let capacityLabel = UILabel()
        capacityLabel.translatesAutoresizingMaskIntoConstraints = false
        capacityLabel.text = "Aquarium Capacity: \(aquarium.capacity) liters"
        containerView.addSubview(capacityLabel)

        NSLayoutConstraint.activate([
            capacityLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            capacityLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
}
