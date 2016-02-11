class PayloadRequest < ActiveRecord::Base
  validates_presence_of :url_id,
                        :requested_at,
                        :responded_in,
                        :referrer_url_id,
                        :request_type_id,
                        :parameters,
                        :event_name_id,
                        :user_agent_id,
                        :resolution_id,
                        :ip_id

    belongs_to :request_type

  #Average Response time for our clients app across all requests
  def self.average_response_time
    average(:responded_in).to_i
  end

  # Max Response time across all requests
  def self.max_response_time
    maximum(:responded_in).to_i
  end

  # Min Response time across all requests
  def self.min_response_time
    minimum(:responded_in).to_i
  end

  # Most frequent request type
  def self.most_frequent_request_type
    ids_and_count = group(:request_type_id).count
    id = ids_and_count.max_by {|k, v| v}.first
    where(request_type_id: id).first.request_type.verb

  end
  # def self.most_frequent_request_type
  #   #needs refactoring
  #   most_freq_url_id = group("url_request_id")
  #                     .order('count(*) DESC')
  #                     .limit(1)
  #                     .pluck(:url_request_id)
  #                     .first
  #
  #   Verb.find(most_freq_url_id).request_type
  # end


  # List of all HTTP verbs used
  def self.all_http_verbs_used
    require "pry"
    binding.pry
    pluck(:verb)
  end

  # List of URLs listed form most requested to least requested
  def self.sort_urls_by_request_freqency

  end

  # Web browser breakdown across all requests(userAgent)
  def self.list_browsers_for_all_requests

  end

  # OS breakdown across all requests(userAgent)
  def self.os_browsers_across_all_requests

  end

  # Screen Resolutions across all requests (resolutionWidth x resolutionHeight)
  def self.list_screen_resolutions_across_all_request

  end

  # Events listed from most received to least.(When no events have been defined display a message that states no events have been defined)
  def self.sort_events_most_recieved_to_least

  end

end
