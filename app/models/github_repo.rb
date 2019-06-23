class GithubRepo
  attr_accessor :name, :url

  def initialize(hash)
    self.name = hash['name']
    self.url = hash['html_url']
  end

end