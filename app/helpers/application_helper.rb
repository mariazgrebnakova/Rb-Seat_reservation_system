module ApplicationHelper
    def flash_class
        case key
        when 'notice'
            'info'
        when 'alert'
            'warning'
        else
            key
        end
    end
end
