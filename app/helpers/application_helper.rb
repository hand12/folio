module ApplicationHelper
  def newest_product_name
    @newest_product.user.name
  end
end
