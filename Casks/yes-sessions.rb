cask "yes-sessions" do
  version "5.9.2"
  sha256 "d7fb6f8451d3b389643d1fcc67a8447e849ddf0779a0ff2dfacfbd40c5949f4d"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.9.2/Yes-Sessions-5.9.2-arm64.dmg"
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
