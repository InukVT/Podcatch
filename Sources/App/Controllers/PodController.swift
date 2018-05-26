import Foundation
import Vapor
import Leaf
import SWXMLHash

final class PodController {	
	/*func index(_ req: Request) throws -> Future<View>
	{
		let leaf = try req.make(LeafRenderer.self)
		return //leaf.render("noCast")
	}*/
	func podcast(_ req: Request) throws -> Future<View>
	{
		//Generating the relay FM URL!
		//getting URL parameter
		let rss: String = try req.parameters.next(String.self)
		//let xml =
		return try ParseRSS().xml(req: req, feed: rss).flatMap(to: View.self, { xml in
			let leaf = try req.make(LeafRenderer.self)

			//let podcast = xml["rss"]["channel"]["title"].element?.text
			//print("You've reached the \(podcast ?? "Not Existing") podcast")
			//let author = xml["rss"]["channel"]["itunes:author"][0].element?.text
			//let image = xml["rss"]["channel"]["itunes:image"][0].element?.attribute(by: "href")?.text

		//	var episodes: [PodcastViewParameters.Episode] = []
		//	for elem in xml["rss"]["channel"]["item"].all {
		//		let title = elem["title"].element!.text
		//		let file = (elem["enclosure"].element?.attribute(by: "url")?.text)!
		//		let type = (elem["enclosure"].element?.attribute(by: "type")?.text)!
		//		episodes.append(PodcastViewParameters.Episode(title: title, media: file, type: type))
		//		print("\(title) \n")
		//	}


			let context = Podcast
			return try leaf.render("podcast", context)
		})
	}
    
}

/*
//Example on JSON & HTML returner in same funcy function
enum JSONOrView<C>: ResponseEncodable where C: Content {
case json(C)
case view(View)
}

func foo(_ req: Request) -> Future<JSONOrView<User>> {
if ... {
return User.find(...).map { .json($0) }
} else {
return req.view().make("foo").map { .view($0) }
}
}
*/
