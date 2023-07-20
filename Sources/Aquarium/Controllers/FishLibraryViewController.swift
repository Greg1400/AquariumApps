// FishLibraryViewController.swift

import UIKit

class FishLibraryViewController: UIViewController {
    let fishLibrary: FishLibrary

    init(fishLibrary: FishLibrary) {
        self.fishLibrary = fishLibrary
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fish Library"

        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Here, you can use the fishLibrary.fishes array to populate the table view data
        // For simplicity, we just set the table view data source and delegate to self
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// Add UITableViewDataSource and UITableViewDelegate extensions to handle table view data
// Implement these extensions based on the data in fishLibrary.fishes array
extension FishLibraryViewController: UITableViewDataSource, UITableViewDelegate {
    // Implement the required table view data source methods here
}
