package 'shadow-utils' if platform_family? 'amazon'
package 'util-linux' if platform_family? 'debian'

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
