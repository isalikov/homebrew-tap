# typed: false
# frozen_string_literal: true

class Cgram < Formula
  desc "Terminal client for cgram — anonymous end-to-end encrypted messenger"
  homepage "https://github.com/isalikov/cgram-cli"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/isalikov/cgram-cli/releases/download/v#{version}/cgram-darwin-amd64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "cgram-darwin-amd64" => "cgram"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/isalikov/cgram-cli/releases/download/v#{version}/cgram-darwin-arm64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "cgram-darwin-arm64" => "cgram"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/isalikov/cgram-cli/releases/download/v#{version}/cgram-linux-amd64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "cgram-linux-amd64" => "cgram"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/isalikov/cgram-cli/releases/download/v#{version}/cgram-linux-arm64"
      sha256 "PLACEHOLDER"

      def install
        bin.install "cgram-linux-arm64" => "cgram"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cgram --version 2>&1", 2)
  end
end
