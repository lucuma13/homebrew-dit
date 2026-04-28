class Lookback < Formula
  desc "Bash utility to compare files and directories"
  homepage "https://github.com/lucuma13/lookback"
  url "https://github.com/lucuma13/lookback/archive/refs/tags/1.0.0.tar.gz"
  sha256 "59d9e5c8ed0f19ae4ab16194945977bf4ac161e8c88f74c0dc458211385c5a69"
  license "GPL-3.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Dependencies
  depends_on "xxhash"

  def install
    bin.install "lookback.sh" => "lookback"
  end

  test do
    # Create temporary identical directories
    (testpath/"src").mkpath
    (testpath/"dest").mkpath
    (testpath/"src/file1.txt").write "content"
    (testpath/"dest/file1.txt").write "content"

    # Test: File match
    # Triggers: if [ -f "$lb_src" ] && [ -f "$lb_dest" ]
    file_match = shell_output("#{bin}/lookback #{testpath}/src/file1.txt #{testpath}/dest/file1.txt")
    assert_match "Checksums from file1.txt and file1.txt are identical", file_match

    # Test: Directory match
    dir_match = shell_output("#{bin}/lookback #{testpath}/src #{testpath}/dest")
    assert_match "It's a match", dir_match

    # Test: File mismatch (create extra file on source)
    (testpath/"src/extra.txt").write "extra"
    file_mismatch = shell_output("#{bin}/lookback #{testpath}/src/file1.txt #{testpath}/src/extra.txt", 1)
    assert_match "Calculated hashes are different", file_mismatch

    # Test: Directory mismatch
    dir_mismatch = shell_output("#{bin}/lookback #{testpath}/src #{testpath}/dest", 1)
    assert_match "extra.txt", dir_mismatch
  end
end
