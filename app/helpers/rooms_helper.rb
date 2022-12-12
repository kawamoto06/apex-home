module RoomsHelper
  # 最新メッセージのデータを取得して表示するメソッド
  def most_new_message_preview(room)
    # 最新メッセージのデータを取得する
    message = room.messages.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    message = message[0]
    # メッセージの有無を判定
    if message.present?
      # メッセージがあれば内容を表示
      tag.p "#{message.body}", class: 'dm_list__content__link__box__message'
    else
      # メッセージがなければ[ まだメッセージはありません ]を表示
      tag.p '[ まだメッセージはありません ]', class: 'dm_list__content__link__box__message'
    end
  end

  # 相手ユーザー名を取得して表示するメソッド
  def opponent_user(room)
    # 中間テーブルから相手ユーザーのデータを取得
    entry = room.entries.where.not(user_id: current_user)
    # 相手ユーザーの名前を取得
    name = entry[0].user.user_profile_or_empty
    # 名前を表示
    tag.link_to image_tag name, class: 'user-image4'
  end

  def original(room)
    entry = room.entries.where.not(user_id: current_user)
    # 相手ユーザーの名前を取得
    name2 = entry[0].user.nickname
    tag.h "#{name2}", class: 'orig'
  end
end
