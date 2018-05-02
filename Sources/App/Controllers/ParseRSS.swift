import Foundation
import Vapor
import SWXMLHash

struct ParseRSS {
	/// 
	func xml(req: Request, feed: String) throws -> Future<XMLIndexer> {
		return try req.make(Client.self).get("https://www.relay.fm/\(feed)/feed").then { response in
			return response.http.body.consumeData(on: req)
			}.map{ data in
				return SWXMLHash.parse(data)
		}

	}
}
