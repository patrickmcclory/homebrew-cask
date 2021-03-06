cask :v1 => 'virtualbox-extension-pack' do
  version '5.0.2-102096'   # virtualbox.rb and virtualbox-extension-pack.rb should be upgraded together
  sha256 '0c49864ea7ab2be8b95c4495e5825b0e48b8611e1761c1b22b86a3f4bf9201bf'

  url "http://download.virtualbox.org/virtualbox/#{version.sub(%r{-.*},'')}/Oracle_VM_VirtualBox_Extension_Pack-#{version}.vbox-extpack"
  name 'VirtualBox Extension Pack'
  homepage 'https://www.virtualbox.org'
  license :closed
  tags :vendor => 'Oracle'

  stage_only true

  container :type => :naked

  postflight do
    system 'sudo', 'VBoxManage', 'extpack', 'install', '--replace', "#{staged_path}/Oracle_VM_VirtualBox_Extension_Pack-#{version}.vbox-extpack"
  end

  uninstall_postflight do
    system 'sudo', 'VBoxManage', 'extpack', 'uninstall', 'Oracle VM VirtualBox Extension Pack'
  end

  depends_on :cask => 'virtualbox'
end
