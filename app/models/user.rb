# frozen_string_literal: true

#
# Main class implementing both Host and Volunteer through STI
#
class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :recoverable, :registerable,
         :rememberable, :trackable, :validatable

  validates :description, length: { maximum: 2500 }
  validates :name, presence: true, length: { maximum: 38 }

  before_destroy -> { Message.sent_or_received_by(id).destroy_all }

  has_many :donations

  has_many :sectorizations
  has_many :work_types, through: :sectorizations

  has_many :language_skills, inverse_of: :user
  accepts_nested_attributes_for :language_skills
  has_many :languages, through: :language_skills

  has_many :pictures, dependent: :destroy

  belongs_to :region

  delegate :country, :country_id, to: :region
  scope :from_country, ->(country_id) do
    where(regions: { country_id: country_id })
  end

  delegate :continent, :continent_id, to: :country
  scope :from_continent, ->(continent_id) do
    where(countries: { continent_id: continent_id })
  end

  scope :by_latest_sign_in, -> { order("last_sign_in_at DESC NULLS LAST") }

  scope :confirmed, -> { where.not(confirmed_at: nil) }

  default_scope { includes(region: :country) }

  def blank_img_and_cache(att)
    att["image"].blank? && att["image_cache"].blank?
  end

  accepts_nested_attributes_for :pictures,
                                reject_if: ->(att) { blank_img_and_cache(att) }

  has_many :sent_feedbacks,
           -> { order(updated_at: :desc).includes(:recipient) },
           class_name: "Feedback",
           foreign_key: "sender_id",
           dependent: :destroy

  has_many :received_feedbacks,
           -> { order(updated_at: :desc).includes(:sender) },
           class_name: "Feedback",
           foreign_key: "recipient_id",
           dependent: :destroy

  def messages_with(uid)
    Message.between(id, uid).non_deleted_by(id)
  end

  scope :currently_available, -> { available_in?(Time.zone.now.mon) }
  scope :available_in?, ->(m) { where("availability_mask & ? > 0", 2**(m - 1)) }

  def availability=(availability)
    self.availability_mask = ArrayMask.new((1..12).to_a).mask(availability)
  end

  def availability
    ArrayMask.new((1..12).to_a).unmask(availability_mask)
  end

  def available_in?(month)
    availability.include?(month)
  end

  def location
    "#{region.name}, #{region.country.name}"
  end

  # Use a single route for all subclasess
  def self.model_name
    ActiveModel::Naming.instance_method(:model_name).bind(User).call
  end

  # Use a single partial path for all subclasses
  def to_partial_path
    "users/user"
  end
end
