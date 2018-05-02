//
//  PodcastViewParameters.swift
//  App
//
//  Created by Bastian Inuk Christensen on 24/04/2018.
//

import Foundation
import Vapor

struct PodcastViewParameters: Codable {
	/// The title of the _Podcast_
	let title: String?
	/// The author, this does not necessarily mean the hosts, as some networks places the network name here.
	let author: String?
	/// This is the overall podcast artwork.
	let image: String?

	/// Episode array, for the *ahem* episodes
	let episodes: [Episode]

	struct Episode: Codable {
		/// Title of _episode_
		let title: String
		/// This is where the episode file is located
		let media: String
		/// Is it a video or audio? Is it MP3, OGG, MP4, MKV, etc.? This is the media type of the episode.
		let type: String
	}
}
