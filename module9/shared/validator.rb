module Validator
  def valid?
    validate!
  rescue StandardError
    false
  end
end
