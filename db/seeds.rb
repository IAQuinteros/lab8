User.destroy_all
Chat.destroy_all
Message.destroy_all

10.times do |i|
    User.create!(
        email: "user#{i}@gmail.com",
        firstname: "nombre#{i}",
        lastname: "apellido#{i}"
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
    user = User.all.sample

    next if chat.nil? || user.nil?

    Message.create!(
        chat_id: chat.id,
        user_id: user.id,
        body: "Mensaje #{i + 1} del usuario #{user.firstname}:"
    )
end
