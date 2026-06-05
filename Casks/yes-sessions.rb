cask "yes-sessions" do
  version "9.2.2"
  sha256 "a2ee73a53c9a810cfd305e951530d96135eeda2ecc0c420a8fae1bf17928bf4e"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.2.2/Yes-Sessions-9.2.2-arm64.dmg"
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
