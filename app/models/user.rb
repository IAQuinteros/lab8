class User < ApplicationRecord
    has_many :sent_chats, class_name: 'Chat', foreign_key: 'sender_id', dependent: :destroy
    has_many :received_chats, class_name: 'Chat', foreign_key: 'receiver_id', dependent: :destroy
    has_many :messages, dependent: :destroy


    validates :email, presence: true,  uniqueness: { case_sensitive: false, message: "Ya está en uso" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "no tiene un formato válido" }
    validates :firstname, :lastname, presence: true, length: { maximum: 25 }

    before_validation :normalize_name
    after_commit :log_creation

    private
    def normalize_name
        self.firstname = firstname.strip.titleize
        self.lastname = lastname.strip.titleize
    end

    def log_creation
        puts("Guardado con éxito")
    end
end
