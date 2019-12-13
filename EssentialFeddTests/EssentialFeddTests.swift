//
//  EssentialFeddTests.swift
//  EssentialFeddTests
//
//  Created by zombietux on 2019/12/12.
//  Copyright © 2019 zombietux. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class EssentialFeddTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let clinet = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(clinet.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
