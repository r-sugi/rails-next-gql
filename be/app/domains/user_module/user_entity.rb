# frozen_string_literal: true
module UserModule
  class UserEntity
    # active_modelの使用OK, active_recordの使用NG
    attr_accessor :record

    # record: ActiveRecordインスタンス
    def initialize(record)
      self.record = record
    end

    # delegate :first_name, :last_name, to: :record
    # ドメインロジックを記述する
    # def full_name
    #   "#{first_name} #{last_name}"
    # end
  end
end
