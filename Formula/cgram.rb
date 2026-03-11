# typed: false
# frozen_string_literal: true

class Cgram < Formula
  desc "Terminal client for cgram — anonymous end-to-end encrypted messenger"
  homepage "https://github.com/isalikov/cgram-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isalikov/cgram-cli/releases/download/v1.0.0/cgram-darwin-amd64"
      sha256 "e9517bc15b3cc8a52095df0966873df5cc404ed93039145eec63bd7c99664887"

      def install
        bin.install "cgram-darwin-amd64" => "cgram"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isalikov/cgram-cli/releases/download/v1.0.0/cgram-darwin-arm64"
      sha256 "c4340240324d75e15c8a869fd404bef1639a4a9213791ee35bc5b25c3bb19139"

      def install
        bin.install "cgram-darwin-arm64" => "cgram"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/isalikov/cgram-cli/releases/download/v1.0.0/cgram-linux-amd64"
      sha256 "03ffdb81c0b8ebd1eabf3253d93f707e5664691804d223d0a94e96c10f9646b4"

      def install
        bin.install "cgram-linux-amd64" => "cgram"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isalikov/cgram-cli/releases/download/v1.0.0/cgram-linux-arm64"
      sha256 "89dabb874a9c49c8edfc1950c7d316065e8031edd7c773dc1ec83664e54f8886"

      def install
        bin.install "cgram-linux-arm64" => "cgram"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cgram --version 2>&1", 2)
  end
end
