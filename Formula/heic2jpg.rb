class Heic2jpg < Formula
	desc "A quick way to convert HEIC images to JPG."
	homepage "https://github.com/lucuma13/heic2jpg"
	version "1.0"
	url "https://github.com/lucuma13/heic2jpg/archive/refs/tags/1.0.tar.gz"
	sha256 "60542c9b409e7068094a94a4acde68d1d5f7ab9dade0246ab0d0237eec2fd67f"
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