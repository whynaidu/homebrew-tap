class Envvault < Formula
  desc "Local-first encrypted environment variable manager"
  homepage "https://github.com/whynaidu/envvault"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.1/envvault-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "f010c79dddd2346f1ccfc853b2847a00f0786d88b96738f0546005a91ce87928"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.1/envvault-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "e6eed0157c9c30a71f9e3c6c2d719b9ef9c72ae9743ada9fec853d0c0d3e78eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.1/envvault-v0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f52fc83158e14822b540a60a6a50b0b59944858798edcd983ed570359012e817"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.1/envvault-v0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ceba56830ac504951d0c035ea00777e2c0dd70abfba8ce0db9d1a243eeb93773"
    end
  end

  def install
    bin.install "envvault"
  end

  def post_install
    # Generate shell completions
    (bash_completion/"envvault").write Utils.safe_popen_read(bin/"envvault", "completions", "bash")
    (zsh_completion/"_envvault").write Utils.safe_popen_read(bin/"envvault", "completions", "zsh")
    (fish_completion/"envvault.fish").write Utils.safe_popen_read(bin/"envvault", "completions", "fish")
  end

  test do
    assert_match "envvault", shell_output("#{bin}/envvault --version")
  end
end
