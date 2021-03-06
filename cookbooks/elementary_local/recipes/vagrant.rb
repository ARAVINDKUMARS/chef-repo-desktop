#
# Cookbook:: elementary_local
# Recipe:: vagrant
#
# Copyright:: 2017, Aravind Kumar
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

# Updates the Apt cache
apt_update "update" do
  action :update
  only_if { defined? node["vagrant"]["action"] && node["vagrant"]["action"] == "install" }
end

# Installs Vagrant package
package "vagrant" do
  action node["vagrant"]["action"].to_sym
end