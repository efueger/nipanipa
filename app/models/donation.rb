#
# A donation to the nipanipa cause
#
class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :feedback

  def paypal_url(return_url)
    values = {
      business: ENV['PAYPAL_ACCOUNT'],
      cmd: '_donations',
      item_name: 'Friends of NiPaNiPa',
      amount: amount,
      return: return_url,
      invoice: id
    }

    uri = self.class.base_uri
    uri.query = values.to_query
    uri.to_s
  end

  def self.send_pdt_post(tx)
    http = Net::HTTP.new(base_uri.host, base_uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(base_uri.request_uri)
    post_params = { tx: tx, at: ENV['PAYPAL_PDT_AT'], cmd: '_notify-synch' }
    request.set_form_data(post_params)

    http.request(request)
  end

  def self.base_uri
    URI::HTTP.build(host: ENV['PAYPAL_HOST'],
                    port: ENV['PAYPAL_PORT'],
                    path: '/cgi-bin/websrc')
  end
end
