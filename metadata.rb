name 'nodenv'
maintainer 'Álvaro Faúndez'
maintainer_email 'alvaro@faundeznet'
license 'MIT'
description 'Installs/Configures nodenv'
long_description 'Installs/Configures nodenv'
version '0.1.4'
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
