ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :channel_id, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :channel_id, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
      column :name
      column :channel
      column :start_time do |show|
        show.start_time.strftime("%I:%M %p")
      end
      column :end_time do |show|
        show.end_time.strftime("%I:%M %p")
      end
      column :created_at
      column :updated_at
    actions
  end
  
end
