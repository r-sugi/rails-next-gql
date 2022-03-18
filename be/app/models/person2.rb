# frozen_string_literal: true
class Person2
  extend ActiveModel::Callbacks

  attr_accessor :created_at, :updated_at

  define_model_callbacks :save, only: %i[before after]
  before_save :record_timestamps

  def save
    run_callbacks :save do
      true # saveメソッドの中身をここに記述する
    end
  end

  private

    def record_timestamps
      current_time = Time.current
      self.created_at ||= current_time
      self.updated_at ||= current_time
    end
end
