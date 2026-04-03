class Lookback < Formula
  desc "A Bash utility to compare files and directories"
  homepage "https://github.com/lucuma13/lookback"
  version "1.0"
  url "https://github.com/lucuma13/lookback/archive/refs/tags/1.0.tar.gz"
  sha256 "6cbd204a424a3faf4686c8edf77943ebc20306803b2f7150f60d7a3d323da2ca"
  license "GPL-3.0"

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
