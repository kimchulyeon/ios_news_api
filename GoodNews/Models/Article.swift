//
//  Article.swift
//  GoodNews
//
//  Created by chulyeon kim on 2023/01/26.
//

import Foundation

struct ArticleList: Decodable {
	let articles: [Article]
}

struct Article: Decodable {
	let title: String
	let description: String?
}
