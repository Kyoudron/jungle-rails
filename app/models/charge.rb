class Charge < ActiveRecord::Base

  belongs_to :user
  validates :stripe_id, uniqueness: true

   def receipt
    Receipts::Receipt.new(
      id: id,
      product: "GoRails",
      company: {
        name: "Lighthouse Labs",
        address: "46 Spadina",
        email: "no-reply@jungle.com",
      },

      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{user.name} (#{user.email})"],
        ["Product",        "GoRails"],
        ["Amount",         "$#{amount / 100}.00"],
        ["Charged to",     "#{card_type} (**** **** **** #{card_last4})"],
        ["Transaction ID", uuid]
      ],
    )
  end

end