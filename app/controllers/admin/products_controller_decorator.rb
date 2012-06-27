Spree::Admin::ProductsController.class_eval do
  
  def assign_option_values
    option_values = params[:option_values] || {}
    @object.master.option_values = option_values.values.reject { |id| id.blank? }.map { |id| Spree::OptionValue.find(id) }
  end

end

Spree::Admin::ProductsController.create.before :assign_option_values
Spree::Admin::ProductsController.update.before :assign_option_values
