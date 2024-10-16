# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        div do
          h2 Appointment.count
          h4 'Appointments'
        end
      end
      column do
        div do
          h2 Property.count
          h4 'Properties'
        end
      end
      column do
        div do
          h2 Agent.count
          h4 'Agents'
        end
      end
      column do
        div do
          h2 '20'
          h4 'comments'
        end
      end
    end

    columns do
      column do
        panel 'Recent Properties' do
          ul do
            Property.order(created_at: :desc).limit(5).map do |property|
              li link_to(property.caption, admin_property_path(property))
            end
          end
        end
      end

      column do
        panel 'Recent Appointments' do
          ul do
            Appointment.order(created_at: :desc).limit(5).map do |appointment|
              li link_to(appointment.date, admin_property_path(appointment))
            end
          end
        end
      end
    end
  end
end
