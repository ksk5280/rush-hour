require_relative '../test_helper'

class UserCanViewUrlSpecificStats < FeatureTest

  def test_successfully_shows_data
    create_9_payloads_for_url_stats

    # when I visit a page for a specific url
    visit '/sources/jumpstartlab/urls/blog'

    # then I should see a page that shows the url specific stats
    within(".url-specific-stats") do
      assert page.has_content? "Max Response Time"
      assert page.has_content? "Min Response Time"
      assert page.has_content? "All Response Times"
      assert page.has_content? "Average Response Time"
      assert page.has_content? "HTTP Verbs Used"
      assert page.has_content? "Top Three Referrers"
      assert page.has_content? "Top Three User Agents"
    end
  end

  def test_url_does_not_exists
    create_9_payloads_for_url_stats

    visit '/sources/jumpstartlab/urls/fake'
    # then I should see an error message
    assert_equal '/missing-url', current_path
    within('.missing-url') do
      assert page.has_content? "This url has not been requested"
    end
  end
end
