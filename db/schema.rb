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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170428200857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "edificacaos", force: :cascade do |t|
    t.geography "geom",       limit: {:srid=>4055, :type=>"point", :geographic=>true}
    t.datetime  "created_at",                                                          null: false
    t.datetime  "updated_at",                                                          null: false
    t.string    "descricao"
  end

  create_table "estradas", force: :cascade do |t|
    t.geometry "geom",       limit: {:srid=>0, :type=>"line_string"}
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "ferrovia", force: :cascade do |t|
    t.geography "geom",       limit: {:srid=>4055, :type=>"line_string", :geographic=>true}
    t.datetime  "created_at",                                                                null: false
    t.datetime  "updated_at",                                                                null: false
  end

  create_table "lagos", force: :cascade do |t|
    t.geography "geom",       limit: {:srid=>4055, :type=>"polygon", :geographic=>true}
    t.datetime  "created_at",                                                            null: false
    t.datetime  "updated_at",                                                            null: false
  end

  create_table "logradouros", force: :cascade do |t|
    t.string    "descricao"
    t.geography "localizacao", limit: {:srid=>4055, :type=>"polygon", :geographic=>true}
    t.datetime  "created_at",                                                             null: false
    t.datetime  "updated_at",                                                             null: false
  end

  create_table "pontes", force: :cascade do |t|
    t.geography "geom",       limit: {:srid=>4055, :type=>"line_string", :geographic=>true}
    t.datetime  "created_at",                                                                null: false
    t.datetime  "updated_at",                                                                null: false
  end

  create_table "quadras", force: :cascade do |t|
    t.string    "descricao"
    t.geography "localizacao", limit: {:srid=>4055, :type=>"polygon", :geographic=>true}
    t.datetime  "created_at",                                                             null: false
    t.datetime  "updated_at",                                                             null: false
  end

  create_table "rios", force: :cascade do |t|
    t.geography "geom",       limit: {:srid=>4055, :type=>"line_string", :geographic=>true}
    t.datetime  "created_at",                                                                null: false
    t.datetime  "updated_at",                                                                null: false
  end

  create_table "rodovia", force: :cascade do |t|
    t.geometry "geom",       limit: {:srid=>0, :type=>"line_string"}
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

end
