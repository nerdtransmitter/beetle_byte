# app/helpers/json_helper.rb

module JsonHelper
  def json_with_associations(records, associations)
    records.as_json(include: associations.transform_values { |v| { methods: v } })
  end
end
