user 'user-with-nodenv' do
  home '/home/user-with-nodenv'
  manage_home true
  action :create
end

user 'user-without-nodenv' do
  home '/home/user-without-nodenv'
  manage_home true
  action :create
end
