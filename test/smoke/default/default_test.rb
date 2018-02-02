describe file('/etc/profile.d/nodenv.sh') do
  it { should exist }
end

install_version = '8.2.1'

describe file("/home/vagrant/.nodenv/versions/#{install_version}/bin/node") do
  it { should exist }
end

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/nodenv.sh && nodenv global"') do
  its('exit_status') { should eq 0 }
  its('stdout') { should include(install_version) }
  its('stdout') { should_not match(/system/) }
end

legacy_install_version = '6.11.2'

describe file("/home/vagrant/.nodenv/versions/#{legacy_install_version}/bin/node") do
  it { should exist }
end
