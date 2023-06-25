//
//  ViewController.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 22/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let cityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "city"), for: .normal)
        return button
    }()
    
    var tableView = UITableView()
    
    var products: [Section] = MockData().makeCells()
    
    let categories = CategoriesView()
	
	var networkService: NetworkService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewsSetup()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		fetch()
	}
    
    func viewsSetup() {
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
        view.addSubview(cityButton)

        tableView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)

        cityButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            cityButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cityButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: cityButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        tableView.register(ProductCell.self, forCellReuseIdentifier: String(describing: ProductCell.self))
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: String(describing: BannerTableViewCell.self))
    }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		products.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch products[section] {
		case .banners:
			return 1
			
		case .productsModel(let productsModel):
			print(productsModel.count)
			return productsModel.count
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		switch products[indexPath.section] {
		case .banners(let images):
			guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BannerTableViewCell.self), for: indexPath) as? BannerTableViewCell else { return UITableViewCell()
			}
			cell.bannerCollectionView.source = images
			return cell
			
		case .productsModel(let productsModel):
			guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell else {
				print("no data")
				return UITableViewCell()
			}
			cell.configureCell(with: productsModel[indexPath.row].products)
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
		if section == 1 {
			let catView = CategoriesView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
			catView.delegate = self
			return catView
		}
		return nil
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		switch products[section] {
		case .banners:
			return 0
		case .productsModel(_):
			return 50
		}
	}
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch products[indexPath.section] {
        case .banners:
            return 112
        case .productsModel:
            return UITableView.automaticDimension
        }
    }
}

//MARK: - CategoriesViewDelegate

extension ViewController: CategoriesViewDelegate {
	func categoryDidTap(index: Int) {
		let indexPath = IndexPath(row: index, section: 1)
		tableView.scrollToRow(at: indexPath, at: .top, animated: true)
	}
}


extension ViewController {
	func fetch() {
		networkService?.fetchGoods { [weak self] result in
			guard let self = self else { return }
			
			switch result {
			case .success(let subSectionDTO):
				let productsModel: [ProductsModel] = subSectionDTO.map { section in
					.init(products: self.mapProduct(dto: section.productsDTO))
				}
				
				let productsSection: Section = .productsModel(productsModel)
				self.products[1] = productsSection
				self.tableView.reloadData()
				
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
	
	private func mapProduct(dto: [ProductDTO]) -> [ProductModel] {
		dto.map { item in
				.init(
					image: UIImage(data: item.image),
					title: item.title,
					ingredients: item.ingredients,
					price: item.price,
					onTap: {
						print("положил в корзину")
					}
				)
		}
	}
}
