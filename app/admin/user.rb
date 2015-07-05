ActiveAdmin.register User do
  actions :all, except: [:new, :destroy]

  permit_params :region_id, :locale

  index do
    column :name
    column :email
    column :country
    column :region
    column :karma
    column :sign_in_count

    actions
  end

  filter :email
  filter :name

  form do |f|
    f.inputs 'Information' do
      f.input :email
      f.input :description, input_html: { disabled: true }
    end

    f.inputs 'Location' do
      f.label 'Country', for: 'user_region'
      f.collection_select :country,
                          Country.all.sort_by(&:name),
                          :id,
                          :name,
                          include_blank: true

      f.label 'Region', for: 'user_country'
      f.grouped_collection_select :region_id,
                                  Country.includes(:regions),
                                  :regions,
                                  :name,
                                  :id,
                                  :name,
                                  include_blank: true
    end

    f.actions
  end
end
