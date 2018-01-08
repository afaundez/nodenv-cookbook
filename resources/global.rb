#
# Cookbook:: nodenv
# Resource:: global
#
# Author:: Dan Webb <dan.webb@damacus.io>
#
# Copyright:: 2017, Dan Webb
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
provides :nodeenv_global

property :version, String, name_property: true
property :user, String
property :user_home, String, default: lazy { ::File.expand_path("~#{user}") }

action :install do
  nodenv_command "Set global nodenv version for #{new_resource.user}" do
    version   new_resource.version
    user      new_resource.user
    user_home new_resource.user_home
    command   "nodenv global #{new_resource.version}"
    not_if    { current_global_version_correct? }
  end
end

action_class do
  include Chef::Nodenv::ScriptHelpers

  def current_global_version_correct?
    current_global_version == new_resource.version
  end

  def current_global_version
    version_file = ::File.join(root_path, 'version')

    ::File.exist?(version_file) && ::IO.read(version_file).chomp
  end
end
