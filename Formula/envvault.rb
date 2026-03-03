class Envvault < Formula
  desc "Local-first encrypted environment variable manager"
  homepage "https://github.com/whynaidu/envvault"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.0/envvault-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d63bb1c6aa7bdebe734ac82955a15ee726f80561acd6d9096d0fd12b51b2df0"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.0/envvault-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "d49745fc46fac9917f19171175b299e3abb8bd36ed8493453e8adffd2b865a7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.0/envvault-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2bf55aec708a254fa1f85fe1c43de12d7e5a025da262c7cb6a83fe1f2d014226"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.5.0/envvault-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9567673c470f87405a15c07a6e7b1b2bb2c38b693bcfa48eed78a2bd4ee8b137"
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
