class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ENUMS
  enum role: { project_manager: 0, lead_developer: 1, developer: 2 }

  # VALIDATIONS
  validates :role, inclusion: { in: roles.keys }
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:password_digest] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:password_digest] }

  # ASSOCIATIONS
  has_many :projects
  has_many :created_tickets, class_name: 'Ticket', foreign_key: 'created_by_id'
  has_many :modified_tickets, class_name: 'Ticket', foreign_key: 'modified_by_id'
  has_many :dev_tickets, class_name: 'Ticket', foreign_key: 'dev_id'
  has_one_attached :photo

  # CALLBACKS

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def as_json(options = {})
    super(options.merge({methods: :full_name}))
  end

  def formatted_role
    role.to_s.humanize.titleize
  end

  # Helper method to encapsulate the admin or a specific role check used in Pundit policies
  def has_role_or_admin?(role_name)
    admin? || self.send("#{role_name}?")
  end
end
