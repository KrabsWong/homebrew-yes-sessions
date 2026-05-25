cask "yes-sessions" do
  version "9.1.2"
  sha256 "b38f95e3842e50457a3fbca8f6b157cd5bf0faf0e045945a8dee7a770fdb5c09"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.1.2/Yes-Sessions-9.1.2-arm64.dmg"
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
