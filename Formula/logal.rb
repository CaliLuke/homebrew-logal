class Logal < Formula
  desc "Local OpenTelemetry collector backed by disposable SQLite"
  homepage "https://github.com/CaliLuke/autok-logal"
  url "https://github.com/CaliLuke/autok-logal/releases/download/v0.4.0/autok-logal-0.4.0.tar.gz"
  sha256 "f2128a00aacea0f009c2b3401581be7593584da3c1397cc17cfe009b7226edbc"
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
