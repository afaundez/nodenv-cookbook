nodenv 'vagrant' do
  versions ['8.2.1']
  action   :install
end

nodenv_install ['8.2.1'] do
  user 'vagrant'
end

nodenv_global '8.2.1' do
  user 'vagrant'
end
