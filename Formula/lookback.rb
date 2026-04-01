class Lookback < Formula
  desc "Compare files (checksum) or folders (structure/size)"
  homepage "https://github.com/lucuma13/lookback"
  version "v1.0"
  url "https://github.com/lucuma13/lookback/archive/refs/tags/v1.0.tar.gz"
  sha256 "a63a7c8546c5bde576cf77cca971a9ee79d8ab9963ffd0ce615f97a6ecd3e987"
  license "GPL-3.0"

  depends_on "xxhash"

  def install
    bin.install "lookback.sh" => "lookback"
  end

  test do
    system "lookback -h"
  end
end
