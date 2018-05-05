name 'nodenv'
maintainer 'Alvaro Faundez'
maintainer_email 'alvaro@faundez.net'
license 'MIT'
description 'Installs/Configures nodenv'
long_description 'Installs/Configures nodenv'
version '1.0.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

issues_url 'https://github.com/afaundez/nodenv-cookbook/issues'
source_url 'https://github.com/afaundez/nodenv-cookbook'

supports 'ubuntu'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'freebsd'
supports 'amazon'

depends 'git', '~> 8.0.0'
depends 'node_build', '~> 1.0.0'
