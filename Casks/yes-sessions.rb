cask "yes-sessions" do
  version "5.7.17"
  sha256 "591ab25a875afb2bc190ec2ba906506411a97f3ee5f0a0b7b852c01febf9b00c"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.7.17/Yes-Sessions-5.7.17-arm64.dmg"
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
