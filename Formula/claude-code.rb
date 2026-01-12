class ClaudeCode < Formula
  desc "Anthropic's official CLI for Claude"
  homepage "https://www.anthropic.com/claude-code"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-2.1.5.tgz"
  sha256 "a4958690ab469fc0c832e1dcf8bc614b4b5ae27c6b67228939dd2a5df00ced52"
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