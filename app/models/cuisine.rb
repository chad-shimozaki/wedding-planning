class Cuisine < ApplicationRecord
  has_many  :caterers, class_name: "Caterer", foreign_key: "cuisine_id", dependent: :nullify
end
