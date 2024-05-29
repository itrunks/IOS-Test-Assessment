//
//  ViewController.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  private let viewModel = PostViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerCells()
    viewModel.updateHandler = { [weak self] in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }

    }
    viewModel.fetchPosts()
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfPosts() + 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row < viewModel.numberOfPosts() {
      let cell =
        tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifiers.postCell, for: indexPath)
        as! PostTableViewCell
      if let post = viewModel.post(at: indexPath.row) {
        let title = "\(post.id): \(post.title)"
        cell.configure(with: title)
      }
      return cell
    } else {

      if viewModel.allDataLoaded {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifiers.postCell, for: indexPath) as! PostTableViewCell
          let title  = Constants.Messages.allDataLoaded
          cell.configure(with: title)
        return cell
      } else {
        let cell =
          tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifiers.loaderCell, for: indexPath)
          as! LoaderTableViewCell
        cell.startAnimating()
        return cell
      }
    }
  }

  func tableView(
    _ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath
  ) {
    if indexPath.row == viewModel.numberOfPosts() {
      // Load more data
      viewModel.fetchPosts()
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let post = viewModel.post(at: indexPath.row) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.showDetail, sender: post)
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.SegueIdentifiers.showDetail,
      let detailVC = segue.destination as? DetailViewController,
      let post = sender as? Post
    {
      detailVC.post = post
    }
  }
}
