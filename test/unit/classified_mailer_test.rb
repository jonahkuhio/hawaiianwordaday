require File.dirname(__FILE__) + '/../test_helper'
require 'classified_mailer'

class ClassifiedMailerTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
  end

  def test_contact
    @expected.subject = 'ClassifiedMailer#contact'
    @expected.body    = read_fixture('contact')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ClassifiedMailer.create_contact(@expected.date).encoded
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/classified_mailer/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
