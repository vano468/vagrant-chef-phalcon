# Cookbook Name:: configure
# Recipe:: default

postgresql_database node['configure']['database'] do
  connection(
    host: '127.0.0.1',
    port: 5432,
    username: 'postgres',
    password: node['postgresql']['password']['postgres']
  )
  action :create
end