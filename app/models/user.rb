class User < ApplicationRecord
    validates :user_account, presence: true, uniqueness: true, length:{ maximum: 16, too_long: "最大%{count}文字まで使用できます"}
    validates :password, presence: true, length:{ maximum: 16, too_long: "最大%{count}文字まで使用できます"}
end
