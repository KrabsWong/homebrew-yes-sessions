cask "yes-sessions" do
  version "9.1.1"
  sha256 "3b9295879656acca228fa923e6f395d2e9e36c6b3562dfd633f98584c4d02c65"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.1.1/Yes-Sessions-9.1.1-arm64.dmg"
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
