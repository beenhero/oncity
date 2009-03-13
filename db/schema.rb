# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080831133811) do

  create_table "activities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "target_id"
    t.string   "action_name"
    t.string   "target_name"
    t.string   "midsentence"
    t.string   "project_name"
    t.string   "endconnector"
    t.string   "source_action"
    t.string   "target_type"
    t.integer  "user_id"
    t.string   "source_model"
    t.string   "user_name"
    t.datetime "happened_at"
  end

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "project_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_name"
    t.string   "author_email"
    t.integer  "owner_id"
  end

  create_table "hosted_instances", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "instructions", :force => true do |t|
    t.integer  "project_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author_name"
    t.string   "author_contact"
    t.string   "homepage_url"
    t.string   "source_url"
    t.string   "license"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumb_url",                                             :default => "/images/default_screenshots/thumb.png"
    t.string   "preview_url",                                           :default => "/images/default_screenshots/medium.png"
    t.string   "screenshot_url",                                        :default => "/images/default_screenshots/original.png"
    t.string   "download_url"
    t.boolean  "in_gallery",                                            :default => false
    t.boolean  "is_submitted",                                          :default => false
    t.integer  "owner_id"
    t.datetime "promoted_at"
    t.integer  "author_id"
    t.string   "short_description"
    t.integer  "rating_count"
    t.integer  "rating_total"
    t.decimal  "rating_avg",             :precision => 10, :scale => 2
    t.text     "cached_tag_list"
    t.integer  "downloads",                                             :default => 0
    t.integer  "bookmarks_count",                                       :default => 0
    t.integer  "comments_count",                                        :default => 0
    t.integer  "versions_count",                                        :default => 0
    t.integer  "hosted_instances_count",                                :default => 0
    t.integer  "screenshots_count",                                     :default => 0
    t.integer  "instructions_count",                                    :default => 0
    t.datetime "last_changed"
    t.string   "requirements"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rated_id"
    t.string   "rated_type"
    t.integer  "rating"
    t.datetime "created_at"
  end

  add_index "ratings", ["rated_type", "rated_id"], :name => "index_ratings_on_rated_type_and_rated_id"
  add_index "ratings", ["rater_id"], :name => "index_ratings_on_rater_id"

  create_table "screenshots", :force => true do |t|
    t.integer  "project_id"
    t.integer  "owner_id"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "screenshot_updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                   :default => "anonymous"
    t.datetime "deleted_at"
    t.boolean  "admin",                                   :default => false
    t.string   "ip_address"
    t.string   "name"
    t.string   "homepage"
    t.text     "profile"
    t.boolean  "signed_up",                               :default => false
    t.text     "bookmark_blob"
    t.boolean  "show_alert",                              :default => false
    t.boolean  "show_welcome",                            :default => true
    t.boolean  "spammer",                                 :default => false
    t.string   "forgot_password_hash"
    t.datetime "forgot_password_expire"
    t.integer  "tell_friend_count",                       :default => 0
    t.datetime "tell_friend_last_sent"
    t.string   "identity_url"
  end

  add_index "users", ["ip_address"], :name => "index_users_on_ip_address"
  add_index "users", ["login"], :name => "index_users_on_login"

  create_table "versions", :force => true do |t|
    t.integer  "project_id"
    t.integer  "uploader_id"
    t.string   "title"
    t.text     "notes"
    t.string   "link"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.datetime "download_updated_at"
  end

end
