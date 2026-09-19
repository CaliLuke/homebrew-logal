class Logal < Formula
  desc "Local OpenTelemetry collector backed by disposable SQLite"
  homepage "https://github.com/CaliLuke/autok-logal"
  url "https://github.com/CaliLuke/autok-logal/releases/download/v0.5.0/autok-logal-0.5.0.tar.gz"
  sha256 "81aa7fb8527cac7ae037d9712b1b7e204300f7f525e51e59b19690840decc122"
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
