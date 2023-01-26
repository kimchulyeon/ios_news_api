//
//  WebService.swift
//  GoodNews
//
//  Created by chulyeon kim on 2023/01/26.
//

import Foundation

class WebService {
	
	/// 뉴스 기사 API 호출
	/// - Parameters:
	///   - url: api URL
	///   - completion: 기사 리스트를 파라미터로 받는 클로져
	static func getArticle(url: URL, completion: @escaping ([Article]?) -> ()) {
//		URLSession.shared.dataTask(with: url) { data, res, err in
//			if let error = err {
//				print(error.localizedDescription)
//				completion(nil)
//			} else if let data = data {
//				let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
//				if let articleList = articleList {
//					completion(articleList.articles)
//				}
//				print(articleList?.articles)
//			}
//		}.resume()
		URLSession.shared.dataTask(with: url) { data, res, err in
			if let err = err {
				print(err.localizedDescription)
				completion(nil)
			} else if let data = data {
				let response = try? JSONDecoder().decode(ArticleList.self, from: data)
				let articleList = response?.articles
				
				completion(articleList)
			}
		}.resume()
	}
}
