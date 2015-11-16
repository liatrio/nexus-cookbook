
execute "download install Nexus OSS" do
  command <<-EOL
    wget #{node[:nexus][:url]}
    tar -xvf nexus-#{node[:nexus][:external_version]}-bundle.tar.gz
    mv nexus-#{node[:nexus][:external_version]}-bundle.tar.gz /opt
    ln -s nexus-#{node[:nexus][:external_version]} nexus
EOL
  cwd "/usr/local"
end

execute "run Nexus OSS" do
  command <<-EOL
    ./nexus start
EOL
  cwd "/usr/local/nexus/bin"
end

# set NEXUS_HOME ?


