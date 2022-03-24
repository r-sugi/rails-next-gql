# frozen_string_literal: true
module Loaders
  class AssociationCountLoader < GraphQL::Batch::Loader
    def self.validate(model, association_name)
      new(model, association_name)
      nil
    end

    def initialize(model, association_name, where: nil)
      super()
      @model = model
      @association_name = association_name
      @reflection = reflection
      @where = where
    end

    def load(record)
      raise TypeError, "#{@model} loader can't load association for #{record.class}" unless record.is_a?(@model)

      super
    end

    def perform(records)
      counts = query(records)
      records.each do |record|
        key = record_key(record)
        fulfill(record, counts[key] || 0)
      end
    end

    private

      def reflection
        reflection = @model.reflect_on_association(@association_name)
        return reflection if reflection

        raise ArgumentError, "No association #{@association_name} on #{@model}"
      end

      def query(records)
        column = @reflection.join_primary_key
        scope = @reflection.klass
        scope = scope.where(@where) if @where
        scope.where(column => records).group(column).count
      end

      def record_key(record)
        record[@reflection.active_record_primary_key]
      end
  end
end
