Deface::Override.new(
  :virtual_path => "spree/admin/products/_form",
  :name => "master_options",
  :insert_top => "[data-hook='admin_product_form_right']",
  :partial => "admin/products/master_options",
  :disabled => false)
