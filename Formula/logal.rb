class Logal < Formula
  desc "Local OpenTelemetry collector backed by disposable SQLite"
  homepage "https://github.com/CaliLuke/autok-logal"
  url "https://github.com/CaliLuke/autok-logal/releases/download/v0.1.0/autok-logal-0.1.0.tar.gz"
  sha256 "92fd37e1495c6c3723225ac0b9be082ed5635c1c5095315aa39fb440f002baa9"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/logal"
  end

  test do
    system bin/"logal", "--help"
  end
end
