cask "mhl-tool" do
  version "1.31"
  sha256 "c46bfc603a879d20a35250a313ac91fedc34a5bbc36183c9dc0b3173ea849cda"

  url "https://github.com/lucuma13/mhl-tool/releases/download/1.31/mhl-tool-v1.31-macos.pkg"
  name "MHL Tool"
  desc "MHL tool for macOS"
  homepage "https://mediahashlist.org/mhl-tool/"

  pkg "mhl-tool-v1.31-macos.pkg"

  # Uninstall instructions
  uninstall pkgutil: "com.pomfort.mediaHashList.mhl.pkg",
            delete:  "/usr/local/bin/mhl"

  # Test install
  binary "/usr/local/bin/mhl"
end