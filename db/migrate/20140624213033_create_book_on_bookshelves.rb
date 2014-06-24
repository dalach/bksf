class CreateBookOnBookshelves < ActiveRecord::Migration
  def change
    create_table :book_on_bookshelves do |t|
      t.integer :book_id
      t.integer :bookshelf_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
