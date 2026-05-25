class Triplecheck < Formula
  include Language::Python::Virtualenv

  desc "Two- or three-way comparison tool for files and directories"
  homepage "https://github.com/lucuma13/triplecheck"
  url "https://files.pythonhosted.org/packages/86/8e/aef0257d11847d9a1349475935dd8841b258bbbfcd3c0d8164face1cc756/triplecheck-2.0.0.tar.gz"
  sha256 "4f9a31544413c9e85be7eacfc0679e9b1358f08190e47116da0dae0803c86976"
  license "MIT"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  resource "blake3" do
    on_arm do
      url "https://files.pythonhosted.org/packages/06/8e/8458c4285fbc5de76414f243e4e0fcab795d71a8b75324e14959aee699da/blake3-1.0.8-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "c445eff665d21c3b3b44f864f849a2225b1164c08654beb23224a02f087b7ff1"
    end
    on_intel do
      url "https://files.pythonhosted.org/packages/2e/2a/9f13ea01b03b1b4751a1cc2b6c1ef4b782e19433a59cf35b59cafb2a2696/blake3-1.0.8-cp314-cp314-macosx_10_12_x86_64.whl"
      sha256 "2c33dac2c6112bc23f961a7ca305c7e34702c8177040eb98d0389d13a347b9e1"
    end
  end

  resource "xxhash" do
    url "https://files.pythonhosted.org/packages/24/2f/e183a1b407002f5af81822bee18b61cdb94b8670208ef34734d8d2b8ebe9/xxhash-3.7.0.tar.gz"
    sha256 "6cc4eefbb542a5d6ffd6d70ea9c502957c925e800f998c5630ecc809d6702bae"
  end

  def install
    venv = virtualenv_create(libexec, "python@3.14")
    venv.pip_install resource("blake3")
    resources.each do |r|
      next if ["blake3"].include?(r.name)
      venv.pip_install r
    end
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/triplecheck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/triplecheck --version")
  end
end
