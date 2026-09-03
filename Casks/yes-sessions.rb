cask "yes-sessions" do
  version "9.4.0"
  sha256 "df2a2ccc056c007565f2b7fa2d3d50096d0b1389e50cf564f5f1d88d5a44aaf2"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.4.0/Yes-Sessions-9.4.0-arm64.dmg"
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
