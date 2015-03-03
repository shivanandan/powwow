archive = SQLite3::Database.new 'db/past.sqlite3'
# query =  db.execute ("select * from submissions JOIN users USING user_id, id")