class AddVisualAbstactToSubmissions < ActiveRecord::Migration
  def self.up
    add_attachment :submissions, :visual_abstract
  end

  def self.down
    remove_attachment :submissions, :visual_abstract
  end
end
