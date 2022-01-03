//
//  HomeViewController.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK:- Properties

    let sectionsTitle = ["Trending Movies","Popular","Trending TV","Upcoming Movies"]
    var homeViewModel = HomeViewModel()
    let group = DispatchGroup()
    let refreshControl = UIRefreshControl()

    private let DashBoardTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UINib(nibName: MainCategoriesTableCell.identifier, bundle: nil), forCellReuseIdentifier: MainCategoriesTableCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getAllDataFromApi()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DashBoardTableView.frame = view.bounds
    }

    //MARK:- Helper functions
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(DashBoardTableView)
        DashBoardTableView.delegate = self
        DashBoardTableView.dataSource = self
        setupNavigation()
        let headerView = TopDashBoardView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        DashBoardTableView.tableHeaderView = headerView
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        DashBoardTableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        getAllDataFromApi()
    }

    func getAllDataFromApi() {
        getTrendingTV()
        getTrendingMovies()
        getPopularMovies()
        getUpcomingMovies()
        group.notify(queue: .main) {
            self.DashBoardTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

    func setupNavigation() {
        var image = UIImage(named: "hbo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    //MARK:- API functions

    func getTrendingMovies() {
        group.enter()
        homeViewModel.getTrendingMovies { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.group.leave()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
                self.group.leave()
            default:
                break
            }
        }
    }

    func getTrendingTV() {
        group.enter()
        homeViewModel.getTrendingTvs { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.group.leave()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
                self.group.leave()
            default:
                break
            }
        }
    }

    func getPopularMovies() {
        group.enter()
        homeViewModel.getPopular { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.group.leave()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
                self.group.leave()
            default:
                break
            }
        }
    }

    func getUpcomingMovies() {
        group.enter()
        homeViewModel.getUpcomingMovies { (errMsg, errRes, status) in
            switch status {
            case .populated:
                self.group.leave()
            case .error:
                self.alert(message: errMsg ?? "", title: "Error")
                self.group.leave()
            default:
                break
            }
        }
    }

    func goToDetailsView(index: Int, section: Int) {
        var movie: Movie?
        switch section {
        case 0:
            movie = homeViewModel.trendingMoviesResult?.results?[index]
        case 1:
            movie = homeViewModel.popularmoviesResult?.results?[index]
            break
        case 2:
            movie = homeViewModel.trendingTVResult?.results?[index]
            break
        case 3:
            movie = homeViewModel.upcomingMoviesResult?.results?[index]
            break
        default:
            break
        }
        let vc = DetailsViewController()
        vc.imageURL = movie?.poster_path ?? ""
        vc.movDescription = movie?.overview ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- TableView extension

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsTitle.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCategoriesTableCell.identifier, for: indexPath) as? MainCategoriesTableCell else {return UITableViewCell()}
        switch indexPath.section {
        case 0:
            if let movies = homeViewModel.trendingMoviesResult?.results {
                cell.setupCell(data: movies)
            }
            cell.movieSelected = {[weak self] index in
                self?.goToDetailsView(index: index, section: indexPath.section)
            }
        case 1:
            if let movies = homeViewModel.popularmoviesResult?.results {
                cell.setupCell(data: movies)
            }
            cell.movieSelected = {[weak self] index in
                self?.goToDetailsView(index: index, section: indexPath.section)
            }
        case 2:
            if let movies = homeViewModel.trendingTVResult?.results {
                cell.setupCell(data: movies)
            }
            cell.movieSelected = {[weak self] index in
                self?.goToDetailsView(index: index, section: indexPath.section)
            }
        case 3:
            if let movies = homeViewModel.upcomingMoviesResult?.results {
                cell.setupCell(data: movies)
            }
            cell.movieSelected = {[weak self] index in
                self?.goToDetailsView(index: index, section: indexPath.section)
            }
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header  = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitle[section]
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffest = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffest
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
//    }

}
