class CreatePathRewritePathTranslations < ActiveRecord::Migration
  def change
    create_table :path_rewrite_path_translations do |t|
      t.string :old_path
      t.string :new_path

      t.timestamps null: false
    end

    add_index :path_rewrite_path_translations, :old_path
  end
end
