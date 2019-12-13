//
//  EssentialFeddTests.swift
//  EssentialFeddTests
//
//  Created by zombietux on 2019/12/12.
//  Copyright © 2019 zombietux. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class EssentialFeddTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let clinet = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(clinet.requestedURL)
    }

}
