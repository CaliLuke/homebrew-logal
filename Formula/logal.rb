class Logal < Formula
  desc "Local OpenTelemetry collector backed by disposable SQLite"
  homepage "https://github.com/CaliLuke/autok-logal"
  url "https://github.com/CaliLuke/autok-logal/releases/download/v0.2.0/autok-logal-0.2.0.tar.gz"
  sha256 "212642d8caf6a72d5ef28fba9714f810a0fcf12ab5b6656f76b402f2022be136"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/logal"
  end

  test do
    system bin/"logal", "--help"
  end
end
