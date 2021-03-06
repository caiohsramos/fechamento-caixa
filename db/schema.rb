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

ActiveRecord::Schema.define(version: 20170906004804) do

  create_table "caixas", force: :cascade do |t|
    t.string "nome"
    t.decimal "dinheiro", precision: 7, scale: 2
    t.decimal "troco_final", precision: 7, scale: 2
    t.decimal "troco_inicial", precision: 7, scale: 2
    t.decimal "cartao", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data"
  end

  create_table "despesas", force: :cascade do |t|
    t.text "nome"
    t.decimal "valor", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "caixa_id"
    t.index ["caixa_id"], name: "index_despesas_on_caixa_id"
  end

end
