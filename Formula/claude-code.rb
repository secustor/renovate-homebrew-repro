class ClaudeCode < Formula
  desc "Anthropic's official CLI for Claude"
  homepage "https://www.anthropic.com/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-2.0.20.tgz"
  sha256 "345eae3fe4c682df3d8876141f32035bb2898263ce5a406e76e1d74ccb13f601"
  license "Proprietary"

  livecheck do
    url "https://registry.npmjs.org/@anthropic-ai/claude-code/latest"
    strategy :json do |json|
      json["version"]
    end
  end


  depends_on "node"

  conflicts_with cask: "claude-code", because: "both install a `claude` binary"

  def install
    # Install the package using standard npm args
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Test that the binary exists and can be executed
    output = shell_output("#{bin}/claude --version 2>&1")
    assert_match "claude", output
    assert_match version.to_s, output
  end
end