//
//  ViewController.swift
//  Project1-3-Milestone
//
//  Created by Romain Buewaert on 26/07/2021.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        guard let path = Bundle.main.resourcePath else { return }
        guard let items = try? fm.contentsOfDirectory(atPath: path) else { return }

        for item in items {
            if item.hasSuffix(".png") {
                flags.append(String(item.dropLast(4)))
            }
        }
        flags = flags.sorted()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)

        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = flags[indexPath.row].uppercased()
        cell.contentConfiguration = contentConfig

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
