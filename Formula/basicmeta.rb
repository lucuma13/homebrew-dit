class Basicmeta < Formula
  desc "A basic metadata utility for sanity checking original camera files (frame rate, resolution and encoded date)."
  homepage "https://github.com/lucuma13/basicmeta"
  version "1.1"
  url "https://github.com/lucuma13/basicmeta/archive/refs/tags/1.1.tar.gz"
  sha256 "4374824191695c52985b788463ef6f7573ff202a07ff87cff6a758c9831270ae"
  license "GPL-3.0"

  # Dependencies
  depends_on "media-info"
  depends_on "exiftool"

  def install
    bin.install "basicmeta.sh" => "basicmeta"
  end

  test do
      system "#{bin}/basicmeta", "--version"
  end
end
