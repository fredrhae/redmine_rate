module RedmineRate
  module Hooks
    class MembershipsHook < Redmine::Hook::ViewListener
      def view_users_memberships_table_header(_context = {})
        content_tag(:th, l(:label_rate) + ' ' + currency_name)
      end

      def view_users_memberships_table_row(context = {})
        context[:controller].send(:render_to_string,
                                  partial: 'users/membership_rate',
                                  locals: {
                                    membership: context[:membership],
                                    user: context[:user]
                                  })
      end
    end
  end
end
