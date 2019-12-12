//
//  FeedLoader.swift
//  EssentialFedd
//
//  Created by zombietux on 2019/12/12.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

