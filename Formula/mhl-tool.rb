class MhlTool < Formula
  desc "MHL Tool by Media Hash List"
  homepage "https://mediahashlist.org/mhl-tool/"
  version "1.31"
  license "MIT"

  # Detect OS and fetch the corresponding raw binary
  if OS.mac?
    url "https://github.com/lucuma13/mhl-tool/releases/download/1.31/mhl-tool-v1.31-macos"
    sha256 "7c13d1878ae47b745f44740692c7a7b499f95d0dd1367b181e15a981574122e6"
  elsif OS.linux?
    url "https://github.com/lucuma13/mhl-tool/releases/download/1.31/mhl-tool-v1.31-linux"
    sha256 "7c7f59bad8ca0054920e612b5a79b8183152c4ddd854064217a945502044af5a"
  end

  def install
    # Rename the OS-specific binary to 'mhl' during installation
    binary_name = OS.mac? ? "mhl-macos" : "mhl-linux"
    bin.install binary_name => "mhl"
  end

  test do
    assert_match "Version: 0.1.31", shell_output("#{bin}/mhl --version")
  end
end