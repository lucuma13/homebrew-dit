class MhlTool < Formula
  version "1.31"
  desc "MHL Tool (CLI version)"
  homepage "https://mediahashlist.org/mhl-tool/"
  url "https://github.com/lucuma13/mhl-tool/releases/download/1.31/mhl-tool-v1.31-linux"
  sha256 "7c7f59bad8ca0054920e612b5a79b8183152c4ddd854064217a945502044af5a"
  license "MIT"

  def install
    bin.install "mhl"
  end
end