#
# Cookbook:: nodenv
# Resource:: command
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
property :version, String, name_property: true
property :user, String
property :command, String
property :creates, String
property :cwd, String
property :environment, Hash
property :group, String
property :path, Array
property :returns, Array, default: [0]
property :timeout, Integer
property :umask, [String, Integer]
property :live_stream, [true, false], default: false

action :install do
  bash "#{new_resource.command} for user #{new_resource.user}" do
    code script_code
    user new_resource.user if new_resource.user
    creates new_resource.creates if new_resource.creates
    cwd new_resource.cwd if new_resource.cwd
    group new_resource.group if new_resource.group
    returns new_resource.returns if new_resource.returns
    timeout new_resource.timeout if new_resource.timeout
    umask new_resource.umask if new_resource.umask
    environment(script_environment)
    live_stream new_resource.live_stream
  end
end

action_class do
  include Chef::Nodenv::ScriptHelpers

  def script_code
    script = []
    script << %(export NODENV_ROOT="#{root_path}")
    script << %(export PATH="${NODENV_ROOT}/bin:$PATH")
    script << %{eval "$(nodenv init -)"}
    if new_resource.version
      script << %(export NODENV_VERSION="#{new_resource.version}")
    end
    script << new_resource.command
    script.join("\n").concat("\n")
  end

  def script_environment
    script_env = { 'NODENV_ROOT' => root_path }

    script_env.merge!(new_resource.environment) if new_resource.environment

    if new_resource.path
      script_env['PATH'] = "#{new_resource.path.join(':')}:#{ENV['PATH']}"
    end

    if new_resource.user
      script_env['USER'] = new_resource.user
      script_env['HOME'] = ::File.expand_path("~#{new_resource.user}")
    end

    script_env
  end
end
