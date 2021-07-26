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
        // Do any additional setup after loading the view.

        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix(".png") {
                flags.append(String(item.dropLast(4)))
            }
        }
        print (flags)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        // Name is the name of the png file
        cell.textLabel?.text = flags[indexPath.row].uppercased()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
//            vc.selectedImage = "Picture \(indexPath.row + 1) of \(pictures.count)"
            vc.selectedImage = flags[indexPath.row]
//            vc.title = "Flag of "
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }


    
    
    
    
}

