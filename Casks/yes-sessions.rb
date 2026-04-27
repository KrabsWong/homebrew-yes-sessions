cask "yes-sessions" do
  version "8.1.0"
  sha256 "e8a59be36b0555b84ca499207f8810dc459ee7d554d8b99d6c04dceee62bc2f4"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v8.1.0/Yes-Sessions-8.1.0-arm64.dmg"
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
