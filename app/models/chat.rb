class Chat < ApplicationRecord
    belongs_to :sender, class_name: 'User'


    belongs_to :receiver, class_name: 'User'

    has_many :messages, dependent: :destroy

    validate :valid_chat_users



    private
    def valid_chat_users
        if sender_id == receiver_id
            errors.add(:base, "No puedes crear un chat contigo mismo")
        end

        existing_chat = Chat.where(sender_id: sender_id, receiver_id: receiver_id)
                            .or(Chat.where(sender_id: receiver_id, receiver_id: sender_id))
                            .first

        if existing_chat && existing_chat.id != self.id
            errors.add(:base, "Ya existe un chat entre estos dos usuarios")
        end
    end

end
