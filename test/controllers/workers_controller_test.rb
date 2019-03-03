require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get workers_url
    assert_response :success
  end

  test "should get new" do
    get new_worker_url
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post workers_url, params: { worker: { code: @worker.code, email: @worker.email, emp_mode: @worker.emp_mode, exprerience: @worker.exprerience, first_name: @worker.first_name, job_title: @worker.job_title, last_name: @worker.last_name, reporting_manager: @worker.reporting_manager, role: @worker.role, status: @worker.status, tel: @worker.tel } }
    end

    assert_redirected_to worker_url(Worker.last)
  end

  test "should show worker" do
    get worker_url(@worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_worker_url(@worker)
    assert_response :success
  end

  test "should update worker" do
    patch worker_url(@worker), params: { worker: { code: @worker.code, email: @worker.email, emp_mode: @worker.emp_mode, exprerience: @worker.exprerience, first_name: @worker.first_name, job_title: @worker.job_title, last_name: @worker.last_name, reporting_manager: @worker.reporting_manager, role: @worker.role, status: @worker.status, tel: @worker.tel } }
    assert_redirected_to worker_url(@worker)
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete worker_url(@worker)
    end

    assert_redirected_to workers_url
  end
end
