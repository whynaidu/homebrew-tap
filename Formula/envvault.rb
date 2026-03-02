class Envvault < Formula
  desc "Local-first encrypted environment variable manager"
  homepage "https://github.com/whynaidu/envvault"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.1/envvault-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "acd2caf00bb3013304e7e4a485166cb92a9c38426edfefce95ce421c526a79df"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.1/envvault-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "eaf203f8d51091cce4a85cf7c2cb40a22fb2f513096089435aff04fc28e3bcab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.1/envvault-v0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "165b185c5c3980856ba9a4ccb71829de7c13d684dc795afb6c85000d9bc0b0ca"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.1/envvault-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c65f1a2ece99efd6d72d989d281663b4b5fa8f2558b0a5efc9bd8449ea28a40d"
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
