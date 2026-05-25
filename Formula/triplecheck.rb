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

  depends_on "rust" => :build
  depends_on "python@3.13"

  resource "blake3" do
    url "https://files.pythonhosted.org/packages/75/aa/abcd75e9600987a0bc6cfe9b6b2ff3f0e2cb08c170addc6e76035b5c4cb3/blake3-1.0.8.tar.gz"
    sha256 "513cc7f0f5a7c035812604c2c852a0c1468311345573de647e310aca4ab165ba"
  end

  resource "xxhash" do
    url "https://files.pythonhosted.org/packages/24/2f/e183a1b407002f5af81822bee18b61cdb94b8670208ef34734d8d2b8ebe9/xxhash-3.7.0.tar.gz"
    sha256 "6cc4eefbb542a5d6ffd6d70ea9c502957c925e800f998c5630ecc809d6702bae"
  end

def install
    # Prepend the Rust bin path to the PATH environment variable so pip/maturin can find cargo
    ENV.prepend_path "PATH", Formula["rust"].opt_bin
    
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/triplecheck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/triplecheck --version")
  end
end
