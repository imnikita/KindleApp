//
//  ViewController.swift
//  KindleApp
//
//  Created by Nikita Popov on 17.03.2021.
//

import UIKit


class ViewController: UITableViewController {
    
    var books: [Book]?
    let cellID = "cell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarButtons()
        setupNavigationBarStyles()
        
        navigationItem.title = "Kindle"
        
        tableView.register(BookCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorColor = .lightGray
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            self.tableView.insetsContentViewsToSafeArea = false
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
        
        tableView.tableFooterView = UIView()

        self.extendedLayoutIncludesOpaqueBars = false

        fetchBooks()
        
    }
        
    
    func setupNavBarButtons() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .edit)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Amazon", style: .plain, target: self, action: #selector(visitAmazonSite))

    }

    
    @objc func visitAmazonSite() {
        
    }
    
    private func setupNavigationBarStyles() {

        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    
    
    
    private func fetchBooks() {
        
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error during books' fetching: ", error!)
            }
            
            guard let safeData = data else { return }
            
            do{
                let json = try JSONSerialization.jsonObject(with: safeData, options: .mutableContainers)
                guard let bookDictionaries = json as? [[String : Any]] else { return }
                
                self.books = []
                for bookDict in bookDictionaries{
                    let book = Book(dictionary: bookDict)
                    self.books?.append(book)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let error{
                print("Error with JSON serialization: ", error)
            }
        }.resume()
    }
    
    // MARK: - UITableViewDataSource methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookCell
        cell.book = books?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let pagesController = BookPagesController(collectionViewLayout: layout)
        pagesController.book = books?[indexPath.row]
        let navController = UINavigationController(rootViewController: pagesController)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    // MARK: - Footer settings methods
    

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)

        let segmentedControll = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(segmentedControll)
        segmentedControll.tintColor = .white
        segmentedControll.selectedSegmentIndex = 1
        segmentedControll.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControll.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControll.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControll.centerYAnchor.constraint(equalTo: footerView.centerYAnchor ).isActive = true
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        70
    }
    
    

}

