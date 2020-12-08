class Production < ApplicationRecord
	has_many :production_details, dependent: :destroy
	has_one_attached :image
	 accepts_nested_attributes_for :production_details, allow_destroy: true, reject_if: :all_blank
	 enum brand: {"samsung" => 0, "nokia" => 1, "apple" => 2, "oppo" => 3, "xiaomi" => 4,
		"realme" => 5, "vivo" => 6, "orther" => 7}
end
