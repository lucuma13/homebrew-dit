class Heic2jpg < Formula
	desc "A quick way to convert HEIC images to JPG."
	homepage "https://github.com/lucuma13/heic2jpg"
	version "1.0"
	url "https://github.com/lucuma13/heic2jpg/archive/refs/tags/1.0.tar.gz"
	sha256 "669024bf250eed8c7cdc51e56dd2604673dd16b185098fd36e2a0a75c13a699a"
	license "GPL-3.0"

	# Dependencies
	depends_on "imagemagick"
	depends_on "libheif"

	def install
		bin.install "heic2jpg.sh" => "heic2jpg"
	end

	test do
		# Verify version
	    system "#{bin}/heic2jpg", "--version"
		# Verify that imagemagick was built with HEIC support (important for Linux users)
		assert_match "heic", shell_output("#{Formula["imagemagick"].opt_bin}/magick identify -list format")
	end
end