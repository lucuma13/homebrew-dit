class Heic2jpg < Formula
  desc "Quick way to convert HEIC images to JPG"
  homepage "https://github.com/lucuma13/heic2jpg"
  url "https://github.com/lucuma13/heic2jpg/archive/refs/tags/1.1.tar.gz"
  sha256 "5195797b4d0000770af61a1b2ac3aebf7ebb3f6fe7422bbd20fc2f122922dcb3"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://github.com/lucuma13/heic2jpg/releases/latest"
    strategy :github_latest
  end

  depends_on "imagemagick"
  depends_on "libheif"

  def install
    bin.install "heic2jpg.sh" => "heic2jpg"
  end

  test do
    system bin/"heic2jpg", "--version"
    assert_match "heic", shell_output("#{Formula["imagemagick"].opt_bin}/magick identify -list format")
  end
end