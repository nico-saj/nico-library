class Item < ApplicationRecord
  belongs_to :user

  range_partition_by { "(created_at::date)" }
end
