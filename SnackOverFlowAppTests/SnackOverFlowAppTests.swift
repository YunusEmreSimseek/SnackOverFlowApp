//
//  SnackOverFlowAppTests.swift
//  SnackOverFlowAppTests
//
//  Created by Emre Simsek on 23.07.2024.
//

import XCTest

@testable import SnackOverFlowApp

final class SnackOverFlowAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    // Test network manager fetch function
    func testFetchUserAndCheck() async throws {
        // Dummy network manager
        let manager = NetworkManager.networkManager

        // Fetch users
        let userResponse = await manager.fetch(path: .users, method: .get, type: UserResponse.self)

        // check the response has value
        guard userResponse != nil else {
            XCTFail("Your service has error")
            return
        }

        // check the response
        XCTAssertEqual(userResponse?.data?.isEmpty, false)
    }

    // Test network manager post function for login
    func testUserLogin() async throws {
        var token: String = ""
        let registerViewModel: RegisterViewModel = RegisterViewModel()
        token = await registerViewModel.onLoginUser(
            email: "eve.holt@reqres.in",
            password: "cityslicka"
        )
        XCTAssertEqual(token.isEmpty, false)
    }

}
