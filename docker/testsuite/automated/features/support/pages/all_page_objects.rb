page_objects_path = File.expand_path('.', __FILE__)
Dir.glob(File.join(page_objects_path, '**', '*.rb')).each do |f|
  require f
end