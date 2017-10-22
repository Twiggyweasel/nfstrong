# Event Model
class Event < ApplicationRecord
  # Relationships
  has_many :donations, as: :backable
  has_many :activities, dependent: :destroy
  has_many :fundraisers, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :sponsors, dependent: :destroy
  has_many :resources, dependent: :destroy

  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :is_private, -> { active.where(is_private: true) }
  scope :not_private, -> { active.where(is_private: false) }
  scope :flagged_for_inactive, -> { active.where('event_stop < ?', 1.day.ago) }
  # Validations
  validates :goal, presence: true
  validates :category, presence: true
  validates :venue_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :event_start, presence: true
  validates :event_stop, presence: true
  # Methods
  def to_param
    slug
  end

  def set_inactive
    update_column(:is_active, false)
  end

  def total_registrations
    registrations.count
  end

  def initialize_event
    set_slug
    set_defaults
    create_resources
  end

  def set_defaults
    return unless custom_settings
    case category
    when '5K Walk', '5K Walk/Run'
      update_columns(has_donations: true, has_fundraisers: true, has_registrations: true, has_tickets: false, has_progress: true, active: true, has_resources: true)
    when 'Concert'
      update_columns(has_donations: true, has_fundraisers: false, has_registrations: false, has_tickets: true, has_progress: false, active: true, has_resources: false)
    else
      update_columns(has_donations: true, has_fundraisers: true, has_registrations: true, has_tickets: false, has_progress: true, active: true, has_resources: true)
    end
  end

  def create_resources; end

  def set_slug
    if custom_slug
      update_column(:slug, slug.downcase.tr(' ', '-').tr('/', '-'))
    else
      update_column(:slug, "#{Date.today.year}-#{category.downcase.tr(' ', '-').tr('/', '-')}-#{state}")
    end
  end
end
