# app/helpers/tickets_helper.rb

module TicketsHelper
  def tickets_json(tickets)
    tickets.as_json(include: {
      created_by: { methods: :full_name },
      modified_by: { methods: :full_name },
      dev: { methods: :full_name },
      project: {}
    })
  end
end
