cask "yes-sessions" do
  version "8.2.1"
  sha256 "8749c140793408014748bfde5ef4e0524ec23c7ed6bbaccbb321dca1b7246cfd"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.2.1/Yes-Sessions-8.2.1-arm64.dmg"
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
