cask "lifsaver" do
  version "0.1.0-beta.1"
  sha256 "6a3f3816f70ff6ae16029f73e0cb046d4f35c5b6d20651ad5bbb12c4b683efe0"

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
