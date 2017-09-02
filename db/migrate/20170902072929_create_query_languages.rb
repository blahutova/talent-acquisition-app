class CreateQueryLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :query_languages do |t|

      t.timestamps
    end
  end
end
