ActiveRecord::Schema[7.1].define(version: 20_231_207_120_538) do
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'post_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_likes_on_post_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.bigint 'author_id'
    t.string 'title'
    t.text 'text'
    t.integer 'comments_counter'
    t.integer 'likes_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_posts_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'photo'
    t.text 'bio'
    t.integer 'posts_counter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
