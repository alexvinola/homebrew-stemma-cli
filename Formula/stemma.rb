class Stemma < Formula
  desc "Deterministic, local-first compiler for coding-agent context"
  homepage "https://github.com/alexvinola/stemma-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-arm64"
      sha256 "83506ebf7f0e0d2ee0375ae63c136fec4c46bedf3512b759bc4475b1e07845e7"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-amd64"
      sha256 "2ffc2c6fb312c522a6813eda758156df99dffb9d48099b07e658bb975eeba773"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-arm64"
      sha256 "39da93c8a4ebc6a1db3cb84c0f3456bac4d9f4d65efd7cd91af48f481fedcf51"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-amd64"
      sha256 "898244fe35dc13f2ffb1e0aff485da751cc2aa69dedebea7b1bbf2369e0e08df"
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