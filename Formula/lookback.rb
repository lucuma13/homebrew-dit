class Lookback < Formula
  desc "Compare files (checksum) or folders (structure/size)"
  homepage "https://github.com/lucuma13/lookback"
  version "v1.0"
  url "https://github.com/lucuma13/lookback/archive/refs/tags/v1.0.tar.gz"
  sha256 "8abd7b5b759fb28599cf392e8cf1c2f9265e4b3be2c9526a8d52940670da46d0"
  license "GPL-3.0"

  depends_on "xxhash"

  def install
    bin.install "lookback.sh" => "lookback"
  end

  test do
    system "lookback -h"
  end
end
