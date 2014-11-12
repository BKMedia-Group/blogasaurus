class AddInliningFieldsToBlogasaurusImages < ActiveRecord::Migration
  def change
    add_column :blogasaurus_images, :inline, :boolean, default: false
    add_column :blogasaurus_images, :code, :string
    add_column :blogasaurus_images, :alignment, :string
    add_column :blogasaurus_images, :caption, :text
  end
end
