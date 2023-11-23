require 'test_helper'

class TicketPolicyTest < ActiveSupport::TestCase

  fixtures :users, :projects, :tickets
  def setup
    @admin = users(:three)
    @project_manager = users(:one)  # Assuming I have a fixture for project manager
    @lead_dev = users(:two)  # Assuming I have a fixture for lead developer
    @dev = users(:four)  # Assuming I have a fixture for developer
    @project = projects(:project_one)  # Assuming I have a fixture for projects
    @ticket = tickets(:one)  # Assuming I have a fixture for tickets
    @other_ticket = tickets(:two)  # Assuming I have another ticket fixture
  end

  test 'scope should allow access for project manager' do
    policy = TicketPolicy::Scope.new(@project_manager, Ticket).resolve
    assert_equal Ticket.all.to_a, policy.to_a
  end

  test 'scope should allow access if user is lead developer in a project' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy::Scope.new(@lead_dev, Ticket).resolve
    assert_includes policy.to_a, @ticket
  end

  test 'scope should allow access for regular users to their own tickets' do
    @ticket.update(created_by_id: @dev.id, dev_id: @dev.id)
    policy = TicketPolicy::Scope.new(@dev, Ticket).resolve
    assert_equal [@ticket], policy.to_a
  end

  test 'scope should deny access for regular users to other tickets' do
    policy = TicketPolicy::Scope.new(@dev, Ticket).resolve
    assert_not_includes policy.to_a, @other_ticket
  end

  test 'show should allow access for project manager' do
    policy = TicketPolicy.new(@project_manager, @ticket)
    assert policy.show?
  end

  test 'show should allow access for ticket owner' do
    @ticket.update(created_by_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.show?
  end

  test 'show should allow access for lead developer' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy.new(@lead_dev, @ticket)
    assert policy.show?
  end

  test 'create should allow access for project lead' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy.new(@lead_dev, @ticket)
    assert policy.create?
  end

  test 'assign should allow access for project lead' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy.new(@lead_dev, @ticket)
    assert policy.assign?
  end

  test 'update should allow access for ticket owner' do
    @ticket.update(created_by_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.update?
  end

  test 'change_status should allow access for ticket owner' do
    @ticket.update(created_by_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.change_status?
  end

  test 'change_status should allow access for assigned developer' do
    @ticket.update(dev_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.change_status?
  end

  test 'change_status should allow access for project lead' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy.new(@lead_dev, @ticket)
    assert policy.change_status?
  end

  test 'destroy should allow access for admin' do
    policy = TicketPolicy.new(@admin, @ticket)
    assert policy.destroy?
  end

  test 'destroy should allow access for project manager' do
    policy = TicketPolicy.new(@project_manager, @ticket)
    assert policy.destroy?
  end

  test 'destroy should allow access for ticket owner' do
    @ticket.update(created_by_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.destroy?
  end

  test 'close_ticket should allow access for admin' do
    policy = TicketPolicy.new(@admin, @ticket)
    assert policy.close_ticket?
  end

  test 'close_ticket should allow access for assigned developer' do
    @ticket.update(dev_id: @dev.id)
    policy = TicketPolicy.new(@dev, @ticket)
    assert policy.close_ticket?
  end

  test 'close_ticket should allow access for project lead' do
    @project.update(lead_dev_id: @lead_dev.id)
    policy = TicketPolicy.new(@lead_dev, @ticket)
    assert policy.close_ticket?
  end
end
