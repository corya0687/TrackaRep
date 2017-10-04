require 'test_helper'

class RunTest < ActiveSupport::TestCase
  should 'create run' do
    create(:run)
    assert Run.count == 1
  end

end
