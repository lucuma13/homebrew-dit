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

  depends_on "python@3.13"

  resource "blake3" do
    on_arm do
      url "https://files.pythonhosted.org/packages/50/26/f7668be55c909678b001ecacff11ad7016cd9b4e9c7cc87b5971d638c5a9/blake3-1.0.8-cp313-cp313-macosx_11_0_arm64.whl"
      sha256 "d17eb6382634b3a5bc0c0e0454d5265b0becaeeadb6801ed25150b39a999d0cc"
    end
    on_intel do
      url "https://files.pythonhosted.org/packages/55/b8/11de9528c257f7f1633f957ccaff253b706838d22c5d2908e4735798ec01/blake3-1.0.8-cp313-cp313-macosx_10_12_x86_64.whl"
      sha256 "46dc20976bd6c235959ef0246ec73420d1063c3da2839a9c87ca395cf1fd7943"
    end
  end

  resource "xxhash" do
    url "https://files.pythonhosted.org/packages/24/2f/e183a1b407002f5af81822bee18b61cdb94b8670208ef34734d8d2b8ebe9/xxhash-3.7.0.tar.gz"
    sha256 "6cc4eefbb542a5d6ffd6d70ea9c502957c925e800f998c5630ecc809d6702bae"
  end

  def install
    venv = virtualenv_create(libexec, "python@3.13")
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
