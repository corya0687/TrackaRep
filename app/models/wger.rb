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
basket = basket.includes(:apples).where('apple_id == ? or baskets.variety is null', 0,)
