cask "yes-sessions" do
  version "5.8.1"
  sha256 "80b6e054f9ba4fdf8c1cbf23f0f595d3d471a3eaea45e6ee0efa0b80a9559d79"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.8.1/Yes-Sessions-5.8.1-arm64.dmg"
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
