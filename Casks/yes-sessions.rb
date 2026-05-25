cask "yes-sessions" do
  version "9.0.2"
  sha256 "f03a117dedf11a7f9f0ca58d0889f04188065c159bfba4940211f9c9ea308042"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.0.2/Yes-Sessions-9.0.2-arm64.dmg"
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
