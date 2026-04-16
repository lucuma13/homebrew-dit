class Basicmeta < Formula
  desc "Metadata utility for quick checking original camera files"
  homepage "https://github.com/lucuma13/basicmeta"
  url "https://github.com/lucuma13/basicmeta/archive/refs/tags/1.1.tar.gz"
  sha256 "4374824191695c52985b788463ef6f7573ff202a07ff87cff6a758c9831270ae"
  license "GPL-3.0-or-later"

  depends_on "exiftool"
  depends_on "media-info"

  def install
    bin.install "basicmeta.sh" => "basicmeta"
  end

  test do
    system bin/"basicmeta", "--version"
  end
end
