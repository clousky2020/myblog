# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_10_090904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "views", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
    t.index ["article_id"], name: "index_articles_categories_on_article_id"
    t.index ["category_id"], name: "index_articles_categories_on_category_id"
  end

  create_table "articles_labels", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "label_id"
    t.index ["article_id"], name: "index_articles_labels_on_article_id"
    t.index ["label_id"], name: "index_articles_labels_on_label_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "content"
    t.bigint "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recruitment_companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_email"
    t.string "password_digest"
    t.string "company_recruiter_name"
    t.string "recruiter_phone"
    t.string "company_phone"
    t.string "company_address"
    t.string "company_logo"
    t.string "company_size"
    t.string "company_type"
    t.integer "company_date_of_establishment"
    t.boolean "company_introduction", default: false
    t.string "is_certificate"
    t.boolean "is_admin", default: false
    t.datetime "last_login_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_email"], name: "index_recruitment_companies_on_company_email"
    t.index ["company_name"], name: "index_recruitment_companies_on_company_name"
  end

  create_table "recruitment_jobs", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.text "description"
    t.string "work_type"
    t.integer "work_age"
    t.integer "salary_up_limit", default: 0
    t.integer "salary_down_limit", default: 0
    t.string "work_area"
    t.string "detailed_address"
    t.boolean "show", default: false
    t.integer "views", default: 0
    t.integer "hiring_number", default: 1
    t.integer "min_age", default: 18
    t.integer "max_age", default: 70
    t.string "language_requirement"
    t.string "gender"
    t.string "recruitment_department"
    t.string "education"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_recruitment_jobs_on_company_id"
  end

  create_table "recruitment_jobs_resumes", id: false, force: :cascade do |t|
    t.bigint "recruitment_job_id"
    t.bigint "recruitment_resume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruitment_job_id"], name: "index_recruitment_jobs_resumes_on_recruitment_job_id"
    t.index ["recruitment_resume_id"], name: "index_recruitment_jobs_resumes_on_recruitment_resume_id"
  end

  create_table "recruitment_resumes", force: :cascade do |t|
    t.boolean "is_default", default: false
    t.integer "user_id"
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.date "birth"
    t.integer "work_age"
    t.string "education"
    t.string "picture"
    t.string "residential_address"
    t.string "job_seeking_status"
    t.string "marrige_status"
    t.string "household_register"
    t.string "live_address_1"
    t.string "live_address_2"
    t.string "phone"
    t.integer "to_work_time"
    t.string "intention_job"
    t.string "job_category"
    t.string "expect_salary"
    t.string "expect_work_site"
    t.string "work_experience"
    t.string "self_assessment"
    t.string "education_and_training_experience"
    t.string "project_experience"
    t.string "language_abiity"
    t.string "skill_speciality"
    t.string "certificate"
    t.string "other_info"
    t.string "my_production"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "is_default"], name: "index_recruitment_resumes_on_user_id_and_is_default", unique: true
  end

  create_table "recruitment_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "last_login_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_recruitment_users_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "articles"
end
