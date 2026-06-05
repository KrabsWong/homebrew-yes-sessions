cask "yes-sessions" do
  version "9.2.1"
  sha256 "331aa7a2e44a5ddad1c0e25b9452e042af85889737b7fbb87313eeebe2c208a6"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v9.2.1/Yes-Sessions-9.2.1-arm64.dmg"
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
