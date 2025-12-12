class User < ApplicationRecord
  # Callback для преобразования email к нижнему регистру перед сохранением
  before_save :downcase_email

  # Валидация наличия полей
  validates :name, presence: true
  validates :email, presence: true

  # Валидация уникальности email (без учета регистра)
  validates :email, uniqueness: { case_sensitive: false }

  # Валидация формата email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Валидация длины
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :email, length: { maximum: 255 }

  private

  def downcase_email
    self.email = email.downcase
  end
end
