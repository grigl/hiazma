# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120718144631) do

  create_table "about_translations", :force => true do |t|
    t.integer  "about_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "about_translations", ["about_id"], :name => "index_about_translations_on_about_id"
  add_index "about_translations", ["locale"], :name => "index_about_translations_on_locale"

  create_table "abouts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "article_translations", :force => true do |t|
    t.integer  "article_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "article_translations", ["article_id"], :name => "index_article_translations_on_article_id"
  add_index "article_translations", ["locale"], :name => "index_article_translations_on_locale"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contact_translations", :force => true do |t|
    t.integer  "contact_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "contact_translations", ["contact_id"], :name => "index_contact_translations_on_contact_id"
  add_index "contact_translations", ["locale"], :name => "index_contact_translations_on_locale"

  create_table "contacts", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "job_translations", :force => true do |t|
    t.integer  "job_id"
    t.string   "locale"
    t.string   "title"
    t.text     "job_profile"
    t.text     "your_profile"
    t.text     "requirements"
    t.text     "other_skillsets"
    t.text     "how_to_apply"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "job_translations", ["job_id"], :name => "index_job_translations_on_job_id"
  add_index "job_translations", ["locale"], :name => "index_job_translations_on_locale"

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.text     "job_profile"
    t.text     "your_profile"
    t.text     "requirements"
    t.text     "other_skillsets"
    t.text     "how_to_apply"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "project_translations", :force => true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_translations", ["locale"], :name => "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], :name => "index_project_translations_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
