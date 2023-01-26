import UIKit

class NewsListTableVC: UITableViewController {
	
	private var articleListVM: ArticleListViewModel!
	
	//MARK: - lifecycle ============================================
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	//MARK: - func ============================================
	private func setup() {
		navigationController?.navigationBar.prefersLargeTitles = true
		
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=ec064bb59bb64cbab376cb22a405f21e")!
		WebService.getArticle(url: url) { [weak self] articleList in
			guard let list = articleList else { return }
			
			self?.articleListVM = ArticleListViewModel(articles: list)
			
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return articleListVM == nil ? 0 : articleListVM.numberOfSections
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articleListVM == nil ? 0 : articleListVM.numberOfRowsInSection(section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
			fatalError("Cell not found")
		}
		let articleVM =  articleListVM.articleAtIndex(indexPath.row)
		cell.titleLabel.text = articleVM.title
		cell.descriptionLabel.text = articleVM.description
		return cell
	}
}
