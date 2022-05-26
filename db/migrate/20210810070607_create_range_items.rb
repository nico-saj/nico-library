class CreateRangeItems < ActiveRecord::Migration[6.1]
  def up
    drop_table :items

    create_range_partition :items, partition_key: ->{ "(created_at::date)" } do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    create_range_partition_of \
      :items,
      name: :items_a,
      start_range: "2021-01-02",
      end_range: "2021-05-01"

     create_range_partition_of \
       :items,
       name: :items_b,
       start_range: "2021-05-02",
       end_range: "2022-01-01"
  end

  def down
    drop_table :items

    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
