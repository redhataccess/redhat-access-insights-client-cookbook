#
# Cookbook Name:: redhat-access-insights-client
# Recipe:: default
#
# Copyright (c) 2015 Red Hat, Inc., All Rights Reserved.
#
package 'redhat-access-insights'

template '/etc/redhat-access-insights/redhat-access-insights.conf' do
    source 'redhat-access-insights.conf.erb'
end

unless File.exists?("/etc/redhat-access-insights/.registered") or File.exists?("/etc/redhat-access-insights/.unregistered")
    execute "redhat-access-insights --register"
end
