struct BasicSemVer: Equatable, Comparable {
	var major: Int
	var minor: Int
	var patch: Int
	
	init(string: String) throws {
		let split = string.split(separator: ".").map {subsequence in String(subsequence)}
		guard let major = Int(split[0]),
					let minor = Int(split[1]),
					let patch = Int(split[2])
		else { print("failed to create with: \(split)"); throw NSError(domain: "NaN", code: 1) }
		self.major = major
		self.minor = minor
		self.patch = patch
	}
	
	init(major: Int, minor: Int, patch: Int) {
		self.major = major
		self.minor = minor
		self.patch = patch
	}
	
	var string: String {
		"\(self.major).\(self.minor).\(self.patch)"
	}
	
	static func == (lhs: BasicSemVer, rhs: BasicSemVer) -> Bool {
		return lhs.major == rhs.major &&
					 lhs.minor == rhs.minor &&
					 lhs.patch == rhs.patch
	}
	
	static func < (lhs: BasicSemVer, rhs: BasicSemVer) -> Bool {
		return (lhs.major < rhs.major) ||
					 (lhs.major == rhs.major && lhs.minor < rhs.minor) ||
					 (lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch < rhs.patch)
	}
}
