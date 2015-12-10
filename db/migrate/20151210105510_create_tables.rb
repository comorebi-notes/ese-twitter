class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      create_table "posts", force: :cascade do |t|
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.text     "text"
        t.integer  "user_id"
      end

      add_index "posts", ["user_id"], name: "index_posts_on_user_id"

      create_table "users", force: :cascade do |t|
        t.string   "name"
        t.string   "color",           default: "red"
        t.string   "password"
        t.string   "password_digest"
        t.integer  "post_id"
        t.datetime "created_at",                      null: false
        t.datetime "updated_at",                      null: false
      end

      add_index "users", ["post_id"], name: "index_users_on_post_id"
    end
  end
end
