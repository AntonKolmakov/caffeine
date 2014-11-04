class RadioButton < UserFormField
  def formatted_value(field_value)
    available_values.where(id: field_value).limit(1).first.value
  end
end
