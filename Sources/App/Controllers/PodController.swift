import Foundation
import Vapor
import Leaf
import SWXMLHash

final class PodController {
	
	func index(_ req: Request) throws -> Future<View>
	{
		let leaf = try req.make(LeafRenderer.self)
		return leaf.render("noCast")
	}
	
	func podcast(_ req: Request) throws -> Future<View>
	{
		let leaf = try req.make(LeafRenderer.self)
		//getting URL parameter
		let rss: String = try req.parameter(String.self)
		//Generating the relay FM URL!

		let xml = ParseRSS().xml(feed: rss)
		let podcast = xml["rss"]["channel"]["title"][0].element?.text
		print("You've reached the \(podcast) podcast")
		//let author = xml["rss"]["channel"]["itunes:author"][0].element?.text


		let parameters = ["page_title" : "Title"]//\(podcast!) | \(author!)"]
		return leaf.render("podcast", parameters)
		/*return try req.make(Client.self).get(relay).flatMap(to: Data.self)
		{
			$0.http.body.makeData(max: Int.max)
		}.map(to: String?.self)
		{
			data in String(data: data, encoding: .utf8)
		}.flatMap(to: View.self){ response in

			
			//Podcast title!

			print(podcast!)
			//List all episodes!
			/*var defString = "Newest episode of \(podcast!) on the relay network is: \n"
			for elem in xml["rss"]["channel"]["item"].all {
				//Title of podcast episode
				let title = elem["title"].element!.text
				//URL to download the podcast, used for inline media player, when I get around and make this!
				let audio = elem["enclosure"].element?.attribute(by: "url")?.text
				let audioType = elem["enclosure"].element?.attribute(by: "type")?.text
				let newString = "\(title)\nAnd it can be downloaded over at:\n<audio controls><source src=\(audio!) type=\(audioType!)><a>\(audio!)</a></audio>\n"
				defString = defString + newString
			}*/
			
			//generating the website
			return leaf.render("podcast", parameters)
    	}*/
	}
    
}
