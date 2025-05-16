User.delete_all
Chat.delete_all
Message.delete_all

10.times do |i|
    User.create!(
        email: "user#{i}@gmail.com",
        firstname: "nombre#{i+1}",
        lastname: "apellido#{i+1}"
    )
end

10.times do 
    sender_id = User.pluck(:id).sample
    receiver_id = (User.pluck(:id) - [sender_id]).sample

    next if receiver_id.nil?

    Chat.create!(
        sender_id: sender_id,
        receiver_id: receiver_id
    )    
end

10.times do |i|
  chat = Chat.all.sample
  next if chat.nil?

  allowed_user_ids = [chat.sender_id, chat.receiver_id]
  user_id = allowed_user_ids.sample

  Message.create!(
    chat_id: chat.id,
    user_id: user_id,
    body: "Mensaje #{i + 1}"
  )
end