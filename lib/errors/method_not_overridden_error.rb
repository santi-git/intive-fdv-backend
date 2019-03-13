class MethodNotOverriddenError < StandardError
  def initialize(msg = 'Missing method definition')
    super
  end
end