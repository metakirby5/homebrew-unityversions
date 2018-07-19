cask 'unity-webgl-support-for-editor@2017.4.6f1' do
  version '2017.4.6f1,c24f30193bac'
  sha256 'f0e9a73d620d98d4eb300109f69109ba61d076ce7826875c7a4e3af4d2342bb6'

  url "http://netstorage.unity3d.com/unity/#{version.after_comma}/MacEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-#{version.before_comma}.pkg"
  name 'Unity WebGL Build Support'
  homepage 'https://unity3d.com/unity/'

  depends_on cask: 'unity@2017.4.6f1'

  pkg "UnitySetup-WebGL-Support-for-Editor-#{version.before_comma}.pkg"

  preflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', '/Applications/Unity.temp'
    end

    if File.exist? "/Applications/Unity-#{@cask.version.before_comma}"
      FileUtils.move "/Applications/Unity-#{@cask.version.before_comma}", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-#{@cask.version.before_comma}"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall_preflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', '/Applications/Unity.temp'
    end

    if File.exist? "/Applications/Unity-#{@cask.version.before_comma}"
      FileUtils.move "/Applications/Unity-#{@cask.version.before_comma}", '/Applications/Unity'
    end
  end

  uninstall_postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-#{@cask.version.before_comma}"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall pkgutil: 'com.unity3d.WebGLSupport'
end
