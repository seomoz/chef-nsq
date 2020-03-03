# frozen_string_literal: true

# Cookbook Name:: chef-nsq
# Recipe:: accounts
# Author:: Eric Lubow <elubow@simplereach.com>
# Author:: Matt Reiferson <snakes@gmail.com>
#
# Description:: Set up the accounts for NSQ
#

ohai 'reload_passwd' do
  action :nothing
  if Ohai::VERSION >= '7.0.0'
    plugin 'etc'
  else
    plugin 'passwd'
  end
end

nsqd_user = node['nsq']['nsqd']['user']
nsqlookupd_user = node['nsq']['nsqlookupd']['user']
nsqadmin_user = node['nsq']['nsqadmin']['user']
[nsqd_user, nsqlookupd_user, nsqadmin_user].each do |u|
  user u do
    action :create
    system true
  end
end

ohai 'reload_passwd'
