module ApplicationHelper
        def flash_class(key)
            case key
            when 'notice'
                'info'
            when 'alert'
                'warning'
            else
                key
            end
        end

        def users_for_select
          current_user.is_admin ? User.all.order(:first_name) : [current_user]
        end

        def seats_for_select
          current_user.is_admin ? Seat.all : Seat.where(department_id: current_user.department_id)
        end
end
