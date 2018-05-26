import Foundation
import Vapor
import XMLCoding

struct ParseRSS {
	/// 
	func xml(req: Request, feed: String) throws -> Future<Podcast> {
		return try req.make(Client.self).get("https://www.relay.fm/\(feed)/feed").then { response in
			return response.http.body.consumeData(on: req)
			}.map{ data in
				return Podcast.retrieveRSS(data)
		}

	}
}
