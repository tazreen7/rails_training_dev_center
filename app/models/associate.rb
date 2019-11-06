class Associate < ApplicationRecord

validate :end_after_start
validates :start_date, :end_date, :presence => true
default_scope { order(created_at: :desc) }
validates  :leave_approval, presence:true,length:{minimum:5,maximum:100 }
  validates :type_of_request, presence:true
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user

private
def end_after_start
  return if end_date.blank? || start_date.blank?

  if end_date < start_date
    errors.add(:end_date, "must be after the start date")
  end
 end
end
