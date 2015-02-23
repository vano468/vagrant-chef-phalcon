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

node['configure']['script_paths'].each do |path|
  bash "run migration #{path}" do
    code <<-COMMAND
    PGPASSWORD=#{node['postgresql']['password']['postgres']} psql \
    --host=localhost \
    --username=postgres \
    --dbname=#{node['configure']['database']} \
    -a -f /vagrant/#{path}
    COMMAND
  end
end