name 'nodenv'
maintainer 'Alvaro Faundez'
maintainer_email 'alvaro@faundez.net'
license 'MIT'
description 'Installs/Configures nodenv'
version '1.0.2'

issues_url 'https://github.com/afaundez/nodenv-cookbook/issues'
source_url 'https://github.com/afaundez/nodenv-cookbook'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'ubuntu'

depends 'git', '~> 10.0.0'
depends 'node_build', '~> 1.0.1'
