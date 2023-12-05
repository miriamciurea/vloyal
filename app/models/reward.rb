class Reward < ApplicationRecord
  belongs_to :card
  has_one_attached :qrcode, dependent: :destroy

  # after_commit :generate_qrcode

  def generate_qrcode
    # Get the host
    host = Rails.application.config.action_controller.default_url_options[:host]
    reward_id = self.id
    p "#{host}/rewards/#{reward_id}"
    # Create the QRCode object
    # qrcode = RQRCode::QRCode.new("http://#{host}/posts/#{id}")
    # qrcode = RQRCode::QRCode.new(post_url(self, host:))
    qrcode = RQRCode::QRCode.new("#{host}/rewards/#{reward_id}")
    # this qr code is for the business side, and this should show that this customer deserve a free #{stuff}
    # set reward.claimed = true
    # prompt to the user that he just received the free stuff ?? idk if it's ok
    # post has to have user_is and brand_id (card_id ?)

    # Create the PNG object
    png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: true,
        resize_gte_to: false,
        size: 120,
        offset: 0
      )

    self.qrcode.attach(
        io: StringIO.new(png.to_s),
        filename: "qrcode.png",
        content_type: "image/png"
      )
  end
end
