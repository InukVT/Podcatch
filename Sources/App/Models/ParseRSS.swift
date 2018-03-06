import Foundation
import Alamofire
import SWXMLHash

struct ParseRSS {
	func xml(feed: String) {
		let response = Alamofire.request("http://www.relay.fm/\(feed)/feed")

		print(response)
		//A variable to execute the feed
		let parsed = SWXMLHash.parse(response!)
		return parsed
	}
}
