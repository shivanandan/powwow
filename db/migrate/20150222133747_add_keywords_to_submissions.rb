class AddKeywordsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :keywords, :string
  end
end
