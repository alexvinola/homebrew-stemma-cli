class Stemma < Formula
  desc "Deterministic, local-first compiler for coding-agent context"
  homepage "https://github.com/alexvinola/stemma-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-arm64"
      sha256 "0c5be3e3eaaa0c5bd64ed42f43ea61c730e1df1fbd7fb7007e1d2e87e3c5bddd"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-amd64"
      sha256 "184bc60787a99dbe91eae90f5db99ed1ce0f1335108d88dc5edf72895bd6fa8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-arm64"
      sha256 "774745d57f7cf9f348d13cae906920a86ce3fb5daa0a3eb7b8d030a8e57a5f38"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-amd64"
      sha256 "c49f9c122dccf8312ef30d121d111550fb39fa2cb2de442065ec4e35387efb04"
    end
  end

  def install
    binary = Dir["stemma-*"].first
    chmod "+x", binary
    bin.install binary => "stemma"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stemma version")
  end
end