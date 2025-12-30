class ClaudeCode < Formula
  desc "Anthropic's official CLI for Claude"
  homepage "https://www.anthropic.com/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-2.0.76.tgz"
  sha256 "fca39936ff8e9310c8e4c6833d6455341b92acd92317785f0f773ee74391b9d9"
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