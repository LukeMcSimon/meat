ActiveAdmin.register Product do

  permit_params :title, :description, :specs, :sku, :price, :image

  filter :title
  filter :sku
  filter :created_at
  filter :price

  index do
    selectable_column
    column :image do |product|
      image_tag url_for(product.image.variant(resize_to_limit: [100, 100]))
    end
    column :title
    column :sku
    column :price
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :image do
        image_tag url_for(product.image.variant(resize_to_limit: [200, 200]))
      end
      row :title
      row :sku
      row 'Customers who want to buy this product' do
        product.carts.map(&:email).join(", ")
      end
      row 'Customers who have bought this product' do
        product.orders.map(&:email).uniq.join(", ")
      end
      row :price
      row :description
      row :specs
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :sku, label: 'SKU', hint: "A unique SKU for this product. Very important!"
      f.input :image, as: :file
      f.input :price, as: :string
      f.input :description
      f.input :specs
    end
    f.actions
  end

  controller do
    defaults finder: :find_by_slug
  end
end
