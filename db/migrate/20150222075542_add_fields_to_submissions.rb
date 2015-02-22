class AddFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :presenter, :string
    add_column :submissions, :current_institution, :text
    add_column :submissions, :other_institutional_affiliations, :text
  end
end
