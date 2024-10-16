# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :agent
  has_many :appointments
  validates :location, :area, :variant, :size, :caption, :price, presence: true

  validates :size, comparison: { greater_than: 0 }

  VALID_VARIANTS = %w[Flat Land].freeze
  validates :variant, inclusion: { in: VALID_VARIANTS }

  VALID_STATUSES = %w[Available Private Locked Sold].freeze
  validates :status, inclusion: { in: VALID_STATUSES }

  VALID_AREAS = %w[Adabar Cantonment Uttara Kafrul Mirpur Mohammadpur Pallabi Rupnagar Savar Uttarkhan].freeze
  validates :area, inclusion: { in: VALID_AREAS }

  has_many_attached :images do |attachable|
    attachable.variant :sm, resize_to_limit: [300, 300], preprocessed: true
  end

  scope :flat, -> { where(variant: 'Flat') }
  scope :land, -> { where(variant: 'Land') }

  scope :available, -> { where(status: 'Available') }
  scope :locked, -> { where(status: 'Locked') }
  scope :private_, -> { where(status: 'Private') }
  scope :sold, -> { where(status: 'Sold') }

  scope :filter_by_variant, ->(variant) { where variant: }
  scope :filter_by_area, ->(area) { where area: }
  scope :filter_by_caption, ->(caption) { where 'property.caption ILIKE ?', "%#{caption}%" }
  scope :order_by, ->(attribute, order) { order("properties.#{attribute} #{order}") }
end
