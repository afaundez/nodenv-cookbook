nodenv_user 'user-with-nodenv'

nodenv_install '8.9.4' do
  user 'user-with-nodenv'
end

nodenv_global '8.9.4' do
  user 'user-with-nodenv'
end

nodenv_node ['6.12.2'] do
  user 'user-with-nodenv'
end
