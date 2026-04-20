cask "yes-sessions" do
  version "5.7.18"
  sha256 "01074c986808e6d742f791bc9a271a2713ffd85e8119a3bf60cbde139b5d9050"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.7.18/Yes-Sessions-5.7.18-arm64.dmg"
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
