class Associate < ApplicationRecord
  # validates :end_date_after_start_date?
  # def end_date_after_start_date?
  #    end_date < start_date
  #     errors.add :end_date, "end date must be after the start date"
  #
  #   end
  validate :end_after_start
validates :start_date, :end_date, :presence => true

private
def end_after_start
  return if end_date.blank? || start_date.blank?

  if end_date < start_date
    errors.add(:end_date, "must be after the start date")
  end
 end
  # validates_format_of :start_date, :with => '/\d{2}\/\d{2}\/\d{4}/'


  validates  :leave_approval, presence:true,length:{minimum:5,maximum:100 }
    validates :type_of_request, presence:true
    validates :start_date, presence: true
    validates :end_date, presence: true
    belongs_to :user


end
