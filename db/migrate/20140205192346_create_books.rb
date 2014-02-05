class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :short_description
      t.string :description
      t.decimal :price
      t.string :cr_id
      t.string :sample_url
      t.string :isbn
      t.string :cover_image
      t.string :format_type
      t.string :drm_id
      t.string :author
      t.string :distribution_model

      t.timestamps
    end
  end
end
