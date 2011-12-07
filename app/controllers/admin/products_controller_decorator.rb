Admin::ProductsController.class_eval do
  
  protected
  
  def assign_option_values
    return unless params.key?(:option_values) && params[:option_values].is_a?(Hash)
    option_values = params[:option_values]
    @object.master.option_values = option_values.values.reject { |id| id.blank? }.map { |id| OptionValue.find(id) }
  end
  
  alias_method(:create_before_without_option_values, :create_before) if method_defined?(:create_before) && !method_defined?(:create_before_without_option_values)
  def create_before
    assign_option_values
    create_before_without_option_values if self.class.method_defined?(:create_before_without_option_values)
  end

  alias_method(:update_before_without_option_values, :update_before) if method_defined?(:update_before) && !method_defined?(:update_before_without_option_values)
  def update_before
    assign_option_values
    update_before_without_option_values if self.class.method_defined?(:update_before_without_option_values)
  end

end