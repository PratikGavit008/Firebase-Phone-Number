//
//  ViewController.swift
//  NewsApi
//
//  Created by Nayan Pawar on 07/02/23.
//

import UIKit
import Kingfisher
import FirebaseAuth

class HeadlinesViewController: UIViewController {

    var newsList : [Articles] = []
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData()
        title = "HEADLINES"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func GetData() {
        ApiManager.shared.getCountriesList { responce in
            switch responce{
            case .success(let news):
                print(news)
                self.newsList.append(contentsOf: news.articles!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        UserDefaults.standard.set(false, forKey: "isLogin")
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let window = scene.windows.first else {
                return
            }
        let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        let navVC = UINavigationController(rootViewController: newVC)
        window.rootViewController = navVC
            window.rootViewController = navVC
            window.makeKeyAndVisible()
        
    }
    
    
}

extension HeadlinesViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineCell", for: indexPath) as? HeadlineCell
    
        else { fatalError() }
        let news = newsList[indexPath.row]
        cell.lblHeadline.text = news.title
        cell.lblChannelName.text = news.author
        cell.lbldate.text = news.publishedAt
        
        cell.imgNews.kf.setImage(
            with: URL(string: news.urlToImage ?? ""),
            placeholder: UIImage(systemName: "newspaper"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
            ])
        
        return cell
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: news)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailsViewController
        destination?.news = sender as? Articles
    }
    
    
}
