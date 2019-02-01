# Use these in the `.tt` templates:
# <%= name.classify.pluralize %>
# <%= name.downcase.pluralize %>
# <%= name.classify.singularize %>
# <%= name.downcase.singularize %>

class CustomScaffoldGenerator < Rails::Generators::NamedBase
  class_option :version, type: :string
  class_option :scope, type: :string

  source_root File.expand_path('templates', __dir__)

  def create_files
    puts "---------"
    puts "Generating scaffold..."
    puts "---------"
    @version = options['version']
    @scope = options['scope']
    return puts "ERROR: Please supply a version with '--version=v1'" if @version.nil?
    return puts "ERROR: The version can only be 'v1'" unless ['v1'].include? @version
    puts "Version: #{@version}"
    return puts "ERROR: Please supply a scope with '--scope=admin'" if @scope.nil?
    return puts "ERROR: The scope can only be 'Admin' or 'Public'" unless ['Admin', 'Public'].include? @scope.classify
    puts "Scope: #{@scope}"
    puts "Name: #{@name}"
    puts "---------"
    template 'migration.rb.tt', "db/migrate/#{timestamp}_create_#{name.downcase.pluralize}.rb"
    template 'model.rb.tt', "app/models/#{name.downcase.singularize}.rb"
    template 'controller.rb.tt', "app/controllers/#{@version}/#{@scope}/#{name.downcase.pluralize}_controller.rb"
    template 'serializer.rb.tt', "app/serializers/#{@version}/#{@scope}/#{name.downcase.singularize}_serializer.rb"
    template 'fixtures.yml.tt', "test/fixtures/#{name.downcase.pluralize}.yml"
    template 'test.rb.tt', "test/integration/#{@version}/#{@scope}/#{name.downcase.pluralize}_test.rb"
    prepend_to_file "#{Rails.root}/config/routes.rb" do
      str = "# TODO: resources :#{name.downcase.pluralize}"
      str << ", path: '/#{name.downcase.pluralize.dasherize}'" if str.include? '_'
      str << "\n"
      str << "\n"
      str
    end
    puts "---------"
    puts "Success!"
    puts "---------"
  end

  private

  def timestamp
    Time.now.utc.strftime('%Y%m%d%H%M%S')
  end
end
