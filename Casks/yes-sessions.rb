cask "yes-sessions" do
  version "5.11.2"
  sha256 "7ea69949fe09b0c52292c29b425849568e6bb5b95ce874447daa8521e8a8d1ba"

  url "https://github.com/KrabsWong/homebrew-yes-sessions/releases/download/v5.11.2/Yes-Sessions-5.11.2-arm64.dmg"
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
