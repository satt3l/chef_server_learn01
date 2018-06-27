node['djanger']['app_to_install'].each do |p|
  package p[:name] do
    action p[:action].nil? ? :install : p[:action]
    version p[:version] unless p[:version]
  end
end

