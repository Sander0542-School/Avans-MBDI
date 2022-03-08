import Foundation

// MARK: - Welcome
struct Music: Codable, Hashable {
	let tracks: Tracks
}

// MARK: - Tracks
struct Tracks: Codable, Hashable {
	let track: [Track]
	let attr: TracksAttr
	
	enum CodingKeys: String, CodingKey {
		case track
		case attr = "@attr"
	}
}

// MARK: - TracksAttr
struct TracksAttr: Codable, Hashable {
	let country, page, perPage, totalPages: String
	let total: String
}

// MARK: - Track
struct Track: Codable, Hashable {
	let name, duration, listeners, mbid: String
	let url: String
	let streamable: Streamable
	let artist: Artist
	let image: [Image]
	let attr: TrackAttr
	
	enum CodingKeys: String, CodingKey {
		case name, duration, listeners, mbid, url, streamable, artist, image
		case attr = "@attr"
	}
}

// MARK: - Artist
struct Artist: Codable, Hashable {
	let name, mbid: String
	let url: String
}

// MARK: - TrackAttr
struct TrackAttr: Codable, Hashable {
	let rank: String
}

// MARK: - Image
struct Image: Codable, Hashable {
	let text: String
	let size: Size
	
	enum CodingKeys: String, CodingKey {
		case text = "#text"
		case size
	}
}

enum Size: String, Codable, Hashable {
	case extralarge = "extralarge"
	case large = "large"
	case medium = "medium"
	case small = "small"
}

// MARK: - Streamable
struct Streamable: Codable, Hashable {
	let text, fulltrack: String
	
	enum CodingKeys: String, CodingKey {
		case text = "#text"
		case fulltrack
	}
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
	let decoder = JSONDecoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		decoder.dateDecodingStrategy = .iso8601
	}
	return decoder
}

func newJSONEncoder() -> JSONEncoder {
	let encoder = JSONEncoder()
	if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
		encoder.dateEncodingStrategy = .iso8601
	}
	return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
	fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				completionHandler(nil, response, error)
				return
			}
			completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
		}
	}
	
	func welcomeTask(with url: URL, completionHandler: @escaping (Music?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return self.codableTask(with: url, completionHandler: completionHandler)
	}
}
