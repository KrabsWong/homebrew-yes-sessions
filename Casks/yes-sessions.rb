cask "yes-sessions" do
  version "8.1.1"
  sha256 "ac001901b0e2b3f6d1b1b9bece76c9aa7dfe6afaa2e72d6bb9c619d2c0dd9538"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.1.1/Yes-Sessions-8.1.1-arm64.dmg"
  name "Yes Sessions"
  desc "AI Session Manager - Browse and resume your AI conversations"
  homepage "https://github.com/KrabsWong/agent-manager"

  # Only support Apple Silicon
  depends_on arch: :arm64

  app "Yes-Sessions.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/Yes-Sessions.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/yes-sessions",
    "~/Library/Preferences/com.yes-sessions.plist",
    "~/Library/Logs/yes-sessions",
    "~/Library/Saved Application State/com.yes-sessions.savedState",
  ]
end
