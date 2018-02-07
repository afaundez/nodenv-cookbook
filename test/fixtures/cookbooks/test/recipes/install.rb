user 'notroot' do
  home '/home/notroot'
  manage_home true
  action :create
end

nodenv 'notroot' do
  versions ['8.2.1']
  action   :install
end

nodenv_install ['8.2.1'] do
  user 'notroot'
end

nodenv_global '8.2.1' do
  user 'notroot'
end
