# frozen_string_literal: true
# Service has ActiveRecord Write case
class UserCreateService
  private_class_method :new

  def self.call(**kwargs)
    new.call(**kwargs)
  end

  def call(name:, email:, password:)
    # Model(ActiveRecord)から集約を復元する
    entity = User.new(name: name, email: email, password: password).user_mapper

    # TODO: 業務ロジックを記述する

    # 永続化する(集約単位, active_recordの使用OK)
    valid = entity.record.save

    { valid: valid, user: entity.record }
  end
end
