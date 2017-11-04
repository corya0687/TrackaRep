class Wger
  include HTTParty
  base_uri 'wger.de'

  def initialize(page: 1)
    @options = { query: { page: page } }
  end

  def exercises
    self.class.get("/api/v2/exercise/", @options)
  end

end
