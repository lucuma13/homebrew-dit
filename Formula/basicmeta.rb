class Basicmeta < Formula
  desc "A basic metadata utility for sanity checking original camera files (frame rate, resolution and encoded date)."
  homepage "https://github.com/lucuma13/basicmeta"
  version "1.0"
  url "https://github.com/lucuma13/basicmeta/archive/refs/tags/1.0.tar.gz"
  sha256 "ed20c912728f943af965f0f7adbf864fe9a56024e93a03f6a23b448b96b4c3b9"
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