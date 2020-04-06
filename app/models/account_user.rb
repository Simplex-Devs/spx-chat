# == Schema Information
#
# Table name: account_users
#
#  id         :bigint           not null, primary key
#  role       :integer          default("agent")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint
#  inviter_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_user_id     (user_id)
#  uniq_user_id_per_account_id        (account_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#

class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user
  belongs_to :inviter, class_name: 'User', optional: true

  enum role: { agent: 0, administrator: 1 }
  accepts_nested_attributes_for :account

  after_create :create_notification_setting
  after_destroy :destroy_notification_setting

  validates :user_id, uniqueness: { scope: :account_id }

  def create_notification_setting
    setting = user.notification_settings.new(account_id: account.id)
    setting.selected_email_flags = [:conversation_assignment]
    setting.save!
  end

  def destroy_notification_setting
    setting = user.notification_settings.new(account_id: account.id)
    setting.destroy!
  end
end
