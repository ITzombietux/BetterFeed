//
//  EssentialFeddTests.swift
//  EssentialFeddTests
//
//  Created by zombietux on 2019/12/12.
//  Copyright © 2019 zombietux. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url : URL)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

class EssentialFeddTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let clinet = HTTPClientSpy()
        _ = RemoteFeedLoader(client: clinet)
        
        XCTAssertNil(clinet.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
