name 'build_cookbook'
maintainer 'Álvaro Faúndez'
maintainer_email 'alvaro@faundeznet'
license 'mit'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
