class Schedule < ApplicationRecord
    validates :title, presence: true, length: {maximum:30}
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: {maximum:300}
    validate :start_end_check
    validate :end_today_check

    def start_end_check
        return if start_date.blank? || end_date.blank?
            errors.add(:end_date, "は開始日より前の日付で登録できません") if start_date > end_date
    end

    def end_today_check
        return if end_date.blank?
            errors.add(:end_date, "は今日以降の日付で選択してください") if end_date < Date.today
    end
end
