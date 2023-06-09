# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def rss_feed_api
    response = HTTParty.get(
      "https://api.airtable.com/v0/#{ENV['AIRTABLE_BASE_ID']}/#{ENV['AIRTABLE_TABLE_NAME']}",
      headers: {
        "Authorization" => "Bearer #{ENV['AIRTABLE_API_KEY']}"
      }
    )
    JSON.parse(response.body)["records"]
  end

  def rss_post
    puts "test test test"
  end

  def get_env_variable(name)
    ENV[name]
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
