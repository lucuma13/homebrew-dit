cask "lifsaver" do
  version "0.1.0-beta.1"
  sha256 "64fc02f6102fd53d747bd282585bfba947cf17dc49f18933482bca9db6f3e6b2"

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
