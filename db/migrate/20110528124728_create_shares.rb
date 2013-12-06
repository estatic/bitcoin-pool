class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.text "rem_host",        :null => false
      t.text "username",        :null => false
      t.text "our_result"
      t.text "upstream_result"
      t.text "reason"
      t.text "solution"
      t.timestamps
    end
    
    # created_at value is usually set by AR, we want it to be at the
    # RDBMS level instead so pushpool INSERTs get timestamped too
    
  end

  def self.down
    drop_table :shares
  end
end
