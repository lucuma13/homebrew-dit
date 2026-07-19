cask "lifsaver" do
  version "0.1.0-beta.1"
  sha256 "057725c014206f4787ce25a068a5921cafb0128f144fb0746d05fa72c3b3681c"

  url "https://github.com/lucuma13/lifsaver/releases/download/#{version}/lifsaver-#{version}-macos-universal.zip"
  name "lifsaver"
  desc "Force-mount external camera cards stuck in macOS LIFS Disk Utility limbo"
  homepage "https://github.com/lucuma13/lifsaver"

  app "Lifsaver.app"

  postflight do
    if OS.mac? && File.exist?("#{appdir}/Lifsaver.app")
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Lifsaver.app"]
    end
  end

  zap trash: [
    "~/Library/Caches/lifsaver",
  ]
end
