cask 'unity-download-assistant@__VERSION_BEFORE_COMMA__' do
  version '__VERSION_BEFORE_COMMA__,__VERSION_AFTER_COMMA__'
  sha256 '__SHA256__'

  url "http://netstorage.unity3d.com/unity/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
