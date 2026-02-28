class Envvault < Formula
  desc "Local-first encrypted environment variable manager"
  homepage "https://github.com/whynaidu/envvault"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.0/envvault-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e4f2093baaba1ef5d0aba05db2da2631b03123ef64f7adbda0721d8a818350c"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.0/envvault-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "25e28e295786a5c5c6a2cd41e757cf20db7ae81f199106565301065fd2706626"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.0/envvault-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "571ea673cf5f422a67ccd09b516994ee9774ef2c2d2925c4248663a9d9c379ea"
    end

    on_intel do
      url "https://github.com/whynaidu/envvault/releases/download/v0.4.0/envvault-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5462ab294fb64d320c44c09bd644365be85280a5c9c2646b8d7db48e933fdcaf"
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
