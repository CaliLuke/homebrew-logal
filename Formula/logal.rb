class Logal < Formula
  desc "Local OpenTelemetry collector backed by disposable SQLite"
  homepage "https://github.com/CaliLuke/autok-logal"
  url "https://github.com/CaliLuke/autok-logal/releases/download/v0.3.0/autok-logal-0.3.0.tar.gz"
  sha256 "ac207d71c2e4ad63d901926b30acb8ebde9924b49e532b1a3ce04b4ebb0a74a2"
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
