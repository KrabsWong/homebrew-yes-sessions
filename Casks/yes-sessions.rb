cask "yes-sessions" do
  version "5.11.3"
  sha256 "1a92d4c7111d84e9cdf10486d61af92efb38b13d05cfbbbcb33f2c3c4a985fb6"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.11.3/Yes-Sessions-5.11.3-arm64.dmg"
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
