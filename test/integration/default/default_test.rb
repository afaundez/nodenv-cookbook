describe file('/etc/profile.d/nodenv.sh') do
  it { should exist }
end

system_version = '9.5.0'

describe file("/usr/local/nodenv/versions/#{system_version}/bin/node") do
  it { should exist }
end

describe command('runuser -l user-without-nodenv -c ". /etc/profile.d/nodenv.sh && nodenv global"') do
  its('exit_status') { should eq 0 }
  its('stdout') { should include(system_version) }
  its('stdout') { should_not match(/system/) }
end

user_version = '8.9.4'

describe file("/home/user-with-nodenv/.nodenv/versions/#{user_version}/bin/node") do
  it { should exist }
end

describe command('runuser -l user-with-nodenv -c ". /etc/profile.d/nodenv.sh && nodenv global"') do
  its('exit_status') { should eq 0 }
  its('stdout') { should include(user_version) }
  its('stdout') { should_not match(/system/) }
end

describe directory("/home/user-with-nodenv/.nodenv/versions/#{user_version}") do
  it { should exist }
  its('owner') { should eq 'user-with-nodenv' }
  its('group') { should eq 'user-with-nodenv' }
end

describe file('/home/user-with-nodenv/.nodenv/version') do
  it { should exist }
  its('owner') { should eq 'user-with-nodenv' }
  its('group') { should eq 'user-with-nodenv' }
end
