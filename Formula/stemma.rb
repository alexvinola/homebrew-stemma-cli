class Stemma < Formula
  desc "Deterministic, local-first compiler for coding-agent context"
  homepage "https://github.com/alexvinola/stemma-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-arm64"
      sha256 "dcd63d4ee50ae3018a8741dc99802b47622264da0180ca6d48492cc7f0365a9e"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-darwin-amd64"
      sha256 "6eee0defd18353f036cfb50a4653089fc51ed76ea1bbdd6d858cfae7a0d9ec56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-arm64"
      sha256 "bf72b61552b1968d5dbece14e9d6b87d13fd6109c9cf098b512ed7f23be61268"
    end
    on_intel do
      url "https://github.com/alexvinola/stemma-cli/releases/download/v#{version}/stemma-linux-amd64"
      sha256 "b449d097511f57e13654a86b1fd76595b923f33debe9bc5ff9c2a33675134b05"
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