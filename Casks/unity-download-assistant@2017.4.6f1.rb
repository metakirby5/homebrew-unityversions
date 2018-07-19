cask 'unity-download-assistant@2017.4.6f1' do
  version '2017.4.6f1,c24f30193bac'
  sha256 'c06d350bf846453f728bef093840eed59e56fa62d05a677f7842ac3a27772807'

  url "http://netstorage.unity3d.com/unity/#{version.after_comma}/UnityDownloadAssistant-#{version.before_comma}.dmg"
  name 'Unity'
  homepage 'https://unity3d.com/unity/'

  installer manual: 'Unity Download Assistant.app'

  uninstall pkgutil: 'com.unity3d.*'
end
