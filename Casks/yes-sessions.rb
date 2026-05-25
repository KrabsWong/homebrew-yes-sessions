cask "yes-sessions" do
  version "9.1.0"
  sha256 "1d04d4125565048c886c90303bbb1f2c50c9e2dd8af1aff7b2de3835c9be878f"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.1.0/Yes-Sessions-9.1.0-arm64.dmg"
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
